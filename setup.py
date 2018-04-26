import configparser
import sys
import os.path

from subprocess import call

def checkBoltedConfigurationFile(boltedConfig):
#        print(boltedConfig['general']['hil'])

        if str(boltedConfig['general']['hil']) == "0.0.0.0" or \
           str(boltedConfig['general']['bmi']) == "0.0.0.0" or \
           str(boltedConfig['general']['keylime-cv']) == "0.0.0.0" or \
           str(boltedConfig['general']['keylime-client']) == "0.0.0.0":
                print("Please change the configuration file to proceed")
        else:
                print("Now start installing bolted system.\n")


                if os.path.exists('hosts'):
             		os.remove('hosts')

             	f = open("hosts","w+")
             	f.write("[hil]\n")
             	f.write(str(boltedConfig['general']['hil']))
             	f.write("\n\n[bmi]\n")
             	f.write(str(boltedConfig['general']['bmi']))
             	f.write("\n\n[keylime-cv]\n")
             	f.write(str(boltedConfig['general']['keylime-cv']))
             	f.write("\n\n[keylime-client]\n")
             	f.write(str(boltedConfig['general']['keylime-client']))
             	f.write("\n")
		f.close()

             	call(["sudo", "cp", "/etc/ansible/hosts", "tmp_hosts"])
             	call(["sudo", "cp", "hosts", "/etc/ansible/hosts"])
             	
             	# installing docker and dependencies on all VMs
             	# call(["ansible-playbook", "ansible/docker_deploy.yml"])

             	# deploying keylime component
             	# call(["ansible-playbook", "ansible/keylime_deploy.yml"])

             	# deploying hil component
             	# call(["ansible-playbook", "ansible/hil_deploy.yml"])

             	# deploying bmi component
             	# call(["ansible-playbook", "ansible/bmi_deploy.yml"])

             	#call(["sudo", "cp", "tmp_hosts", "/etc/ansible/hosts"])

def main():
#	print(sys.argv[1] == 'install')

        if len(sys.argv) <= 1:
                print("Please input argument.\n")

        if sys.argv[1] == "install":
                print("Install bolted system.\n")
                boltedConfig = configparser.ConfigParser()
                boltedConfig.read('bolted.cfg')
                checkBoltedConfigurationFile(boltedConfig)


if __name__ == "__main__":
        main()

