# Bolted System
Bolted system is designed to carve an enclave cloud network through public cloud. By integrating this system, Bolted system is able to provide customers with a secure, elastic, scalable, flexible and user-friendly enclave cloud network. Security assurance is applied not just to the firmware of the physical machine, but also to the operating system, application and generally any software that runs on the machine. 

Bolted System container the following componoents:
* Hil (Hardware isolation layer)
* BMI (Bare Metal Imaging)
* Keylime (node security monitoring)
* Orchestration Engine (node deployment engine)

Here are the link to view full detail of each component: [HIL](https://github.com/CCI-MOC/hil), [BMI](https://github.com/CCI-MOC/ims), [Keylime](https://github.com/mit-ll/python-keylime)

To view the documentation of the system, checkout [Bolted_doc](docs)

## Product List
For this repo, user can use the following item of bolted:
* Installation guide of each system componet and its reference. ([hil_guide](installation_guide/hil), [bmi_guide](installation_guide/bmi), [keylime_guide](installation_guide/keylime))
* Docker container image building Dockerfile and instruction. ([hil_image](containers/hil), [bmi_image](containers/bmi), [keylime_image](containers/keylime))
* Ansible playbook deployment script. ([ansible](ansible))
* Automated installation program.

## Project Features and Solution

For this project, the features included are the following:
It allows the provider to install and configure the Bolted system without worrying about installation and configuration process for each component individually. 
Another feature it that the tenant or client can choose the location for those component, and they can even move the application to a different location even after they have installed it the first time.

To implement this, the project uses kubernetes containers as the installation media or environment instead of a VM. The reason is because a container is convenient and portable as we think about the project requirement. 

## Acceptance Criteria (MVP)

An ansible playbook that is executable which can install and automate the process of installation of HIL, BMI, Keylime and the orchestration engine on the provider’s cloud environment. Our system should deliver a model that facilitates communication using containers implemented on all these components so as to facilitate communication amongst them  Now, separate installation and configuration of each component is not required.


## Mass Open Cloud
This project is part of the larger [Mass Open Cloud](https://massopen.cloud/).
For a description of the team and other information, see
https://github.com/CCI-MOC/moc-public/blob/master/README.md





