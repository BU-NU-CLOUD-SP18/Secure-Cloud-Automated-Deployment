# KEYLIME INSTALLATION

## Dependency
Python version must be 2.7.10 or higher to install keylime

## Installation (Automated)
By uisng this script it will auto install Keylime on a machine, but please follow the following options to install Keylime on either virtual machine or physical machine

```
keylime-insatll.sh
```

Use following option for installatin on virtual machine
```
keylime-install.sh -s 
```


## installation (manual)
First clone both repo to local directory

```
git clone https://github.com/mit-ll/python-keylime.git
git clone https://github.com/BU-NU-CLOUD-SP18/Secure-Cloud-Automated-Deployment.git

```


change ```setup.py``` file in keylime with the file in Secure Cloud repo
```
cp Secure-Cloud-Automated-Deployment/keylime-install/setup.py python-keylime/setup.py 

```

Go to keylime root directory
```
cd python-keylime
```

Run install program
```
sudo installer.sh
```

If keylime is installed on a virtual machine, use the following option
```
sudo installer.sh -s
```
