import configparser
import sys
import os.path

from subprocess import call


def checkBoltedConfigurationFile(boltedConfig, bmiConfig):
    #        print(boltedConfig['general']['hil'])

    # use ping to check vm is reachable !!!!
    if str(boltedConfig['serverip']['hil']) == "0.0.0.0" or \
        str(boltedConfig['serverip']['bmi']) == "0.0.0.0" or \
        str(boltedConfig['serverip']['keylime-server']) == "0.0.0.0" or \
        str(boltedConfig['serverip']['keylime-client']) == "0.0.0.0" or \
        str(boltedConfig['bmi']['uid']).startswith('<') or \
        str(boltedConfig['bmi']['service']).startswith('<') or \
        str(boltedConfig['fs']['id']).startswith('<') or \
        str(boltedConfig['fs']['pool']).startswith('<') or \
        str(boltedConfig['fs']['conf_file']).startswith('<') or \
        str(boltedConfig['fs']['keyring']).startswith('<'):
        print "ERROR: Please change the configuration file to proceed"
        return
    
    if not (os.path.exists('ceph_keyring/'+str(boltedConfig['fs']['keyring'])) and \
        os.path.exists('ceph_keyring/'+str(boltedConfig['fs']['conf_file']))):
        print "ERROR: Please place your ceph key files into ceph_keyring folder."
        return

    print("Now start installing bolted system.\n")

    if os.path.exists('hosts'):
        os.remove('hosts')

    with open("hosts", "w+") as f:
        f.write("[hil]\n")
        f.write(str(boltedConfig['serverip']['hil']))
        f.write("\n\n[bmi]\n")
        f.write(str(boltedConfig['serverip']['bmi']))
        f.write("\n\n[keylime-cv]\n")
        f.write(str(boltedConfig['serverip']['keylime-server']))
        f.write("\n\n[keylime-client]\n")
        f.write(str(boltedConfig['serverip']['keylime-client']))
        f.write("\n")

    # Reconfigure BMI config file
    bmiConfig['bmi']['uid'] = boltedConfig['bmi']['uid']
    bmiConfig['bmi']['service'] = boltedConfig['bmi']['service']
    bmiConfig['fs']['id'] = boltedConfig['fs']['id']
    bmiConfig['fs']['pool'] = boltedConfig['fs']['pool']
    bmiConfig['fs']['conf_file'] = boltedConfig['fs']['conf_file']
    bmiConfig['fs']['keyring'] = boltedConfig['fs']['keyring']
    bmiConfig['net_isolator']['url'] = boltedConfig['serverip']['hil']+':80'

    # Overwrite the original BMI conf file 
    with open("containers/bmi/bmi_config.cfg", 'w') as f:
        bmiConfig.write(f)

    print('Now running all the ansible scripts')
    
    
    call(["sudo", "cp", "/etc/ansible/hosts", "tmp_hosts"])
    call(["sudo", "cp", "hosts", "/etc/ansible/hosts"])
    
    # installing docker and dependencies on all VMs
    call(["ansible-playbook", "ansible/docker_install.yml"])

    # deploying keylime server component
    call(["ansible-playbook", "ansible/keylime_server_deploy.yml"])
    
    # deploying keylime client node component
    keylimeclientargs = ['ansible-playbook', 'ansible/keylime_client_deploy.yml', '-e']
    keylimeserverip = 'myip=' + str(boltedConfig['serverip']['keylime-server'])
    print(keylimeserverip)
    keylimeclientargs.append(keylimeserverip)
    print(keylimeclientargs)
    call(keylimeclientargs)

    # deploying hil component
    call(["ansible-playbook", "ansible/hil_deploy.yml"])

    # deploying bmi component
    call(["ansible-playbook", "ansible/bmi_deploy.yml"])

    call(["sudo", "cp", "tmp_hosts", "/etc/ansible/hosts"])
    
    if os.path.exists('hosts'):
        os.remove('hosts')
    
    if os.path.exists('tmp_hosts'):
        os.remove('tmp_hosts')
    

def main():
    #   print(sys.argv[1] == 'install')

    if len(sys.argv) <= 1:
        print("Please input argument.\n")

    if not os.path.exists('bolted.cfg'):
        print "File 'bolted.cfg' can not be found from current directory, please check before you proceed."
        sys.exit()

    if not os.path.exists('containers/bmi/bmi_config.cfg'):
        print "File 'bmi_config.cfg' can not be found from containers/bmi/, please check before you proceed."
        sys.exit()

    if sys.argv[1] == "install":
        print("Install bolted system.\n")
        boltedConfig = configparser.ConfigParser()
        boltedConfig.read('bolted.cfg')

        bmiConfig = configparser.ConfigParser()
        bmiConfig.read('containers/bmi/bmi_config.cfg')

        checkBoltedConfigurationFile(boltedConfig, bmiConfig)


if __name__ == "__main__":
    main()
