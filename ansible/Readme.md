>Introduction

Ansible is software that automates software provisioning, configuration management, and application deployment. In this project we fouce on mange software on top of hardware. Anisble has several features:

- Agentlss
- Build on top of Python
- Use ssh for secure connection
- push based architecture
- simple to use
 
In this project, we wrote ansible-playbook and run it on the host machines.

> Anisble installation

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

>Ansible configuration and host/server allocation

Ansible uses an inventory file (basically, a list of servers) to communicate with servers.  Like a hosts file (at /etc/hosts) that matches IP addresses to domain names, an Ansible inventory file matches servers (IP addresses or domain names) to groups. Create a file at /etc/ansible/hosts (the default location for Ansible’s inventory file), and add one server to it.
```sh
$ mkdir etc/ansible
$ touch etc/ansible/hosts
```

Edit the file with vim and add the IP address of all server machines.
```sh
[localhost]
127.0.0.1

[ansible1]
10.0.0.13

[ansible2]
10.0.0.9

[keylime-cv]
10.0.0.9

[keylime-client]
10.0.0.13

[hil]
10.0.0.10

[bmi]
10.0.0.14
```
Test Ping-Pong between all virtual machines. 
```sh
$ ansible all -m ping
```
If it could connect successfully we could continue writing and running ansible playbooks.
