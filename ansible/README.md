## Introduction

Ansible is software that automates software provisioning, configuration management, and application deployment. In this project we focus on manging software on top of hardware. Anisble has several features:

- Agentless
- Build on top of Python
- Use ssh for secure connection
- push based architecture
- simple to use
 
In this project, we wrote ansible-playbook and run it on the host machines.

## Anisble installation

As we need install ansible on VMs which based on CentOS, we could not use sudo pip. However, on RedHat/CentOS systems python-pip and ansible are available via the EPEL repository.

To install ansible we first require root access.
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

## Ansible configuration and host/server allocation

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

## Write Ansible playbook and run it on the hosts

Playbooks are Ansible’s configuration, deployment, and orchestration language. They can describe a policy you want your remote systems to enforce, or a set of steps in a general IT process. Using ansible playbook to manage virtual machines and allocate resource will simplify the stpes in our project. Ansible playbook is written in YMAL file. There are three ansible playbooks in this folder which could achieve the goal of install docker, install HIL and install BMI in all the hosts which we added to the /ansible/hosts file.

```sh
$ run ansible-playbook file.yml
```

After checking the syntax error the user could run ansible playbook by using the command line above.
