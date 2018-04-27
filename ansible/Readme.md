Ansible is software that automates software provisioning, configuration management, and application deployment. In this project we fouce on mange software on top of hardware. Anisble has several features:

- Agentlss
- Build on top of Python
- Use ssh for secure connection
- push based architecture
- simple to use
 
In this project, we wrote ansible-playbook and run it on the host machines.

>Anisble installation

As we need install ansible on VMs which based on CentOS, we could not use sudo pip. However, on RedHat/CentOS systems python-pip and ansible are available via the EPEL repository.

To install ansible fistly access to the root.
```sh
$ suso su -
```
Update all the components in this Virtual machine by running
```sh
$ yum update -y
```
Download the package from EPEL repository.
```sh
$ rpm -ivh http://dl.fedoraproject.org/pub/epel/6/i386/epel-release-6-8.noarch.rpm
```
Install ansible using yum.
```sh
$ yum install ansible
```
Test ansible version and finish installation.
```sh
$ ansible --version
```
