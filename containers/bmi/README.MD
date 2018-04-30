# BMI Image
The Bare Metal Imaging (BMI) is a core component of the Massachusetts Open Cloud and an Image Management System(IMS). The files under this Directory is a part of Bolted System deploying process which works with BMI Ansible script to help you build, configure and run a BMI container automatically. Note that you are **NOT** supposed to build a runnable BMI container by manually running "docker build" command from this directory.

## How to play with BMI container
After BMI is successfully built and run, you are able execute the following commands to manage your image.
You should check on your designated BMI node the BMI container is running:
```
sudo docker ps
```

### Several ways to interact with container
Before you start to type your own commands. You can optionally pick one of the following ways to interact with BMI containers.

1. Execute your commands outside the container by adding the "prefix" -- "docker exec". The effective commands will share a format like this:
```
sudo docker exec bmi_image <your bmi command>
```
One example for this can be written as:
```
sudo docker exec bmi_image bmi project ls
```

2. Execute your commands inside the container by attaching your container's shell to your current shell first:
```
sudo docker attach bmi_image
```
Then you are free to type any BMI interaction command you need.

> Manage project in BMI

In BMI, you are supposed to create mutiple project to store images of different kinds.
By default, the automation script already creates a project for your named "project". You can check it by typing:
```
bmi project ls
```

To create a new project, do the following command:
```
bmi project create <project name>
```

> Manage images on ceph

You can check the connection between the BMI and your customized ceph server by typing the following command:
```
bmi db ls
```

For more information about BMI, please visit its official github repository: [https://github.com/CCI-MOC/ims](https://github.com/CCI-MOC/ims)

## Manually install BMI container
However, certain scenarios do require you to build and deploy each component in Bolted seperately. In this case make sure you have gone through the following steps before you create the BMI container using this script.

### Create a directory for ceph configuration files
Do the following command to create a directory in your local machine for ceph authorization. BMI container makes use of Volume to read authorization files from the directory
```
sudo mkdir /etc/ceph
```
Then copy your ceph configuration file under this directory.
Refer to the folder ceph_keyring of this repo to view an example of ceph configuration file.

### Configure bmi configuration file
Open the bmi_config.cfg file under the same directory and fill in all the entries before "Please DO NOT MODIFY the following sections".

### Build the container
Build the container tagged with "bmi" using docker command
```
sudo docker build -t bmi .
```

### Run the container
Run the container you have just built using docker command
```
sudo docker run -dit --name bmi_image -v /etc/ceph:/etc/ceph -p 3260:3260 -p 7000:7000 -p 9000:9000 -p 9893:9893 bmi
```
