# Bolted System: Project Summary

Vidya Anandamurali<br/>
Pei Jia<br/>
Yuxi Jiang<br/>
Jiangnan Zou<br/>

## Project Description and Goal
Bolted system is designed to carve an enclave cloud network through public cloud. By integrating this system, Bolted system is able to provide customers with a secure, elastic, scalable, flexible and user-friendly enclave cloud network. Security assurance is applied not just to the firmware of the physical machine, but also to the operating system, application and generally any software that runs on the machine. 

For this project, we deliver an automated installation and configuration of the Bolted System for cloud provider, so that the provider would not need to install and configure the system component by component before using system. This project associates with the Mass OpenCloud (MOC) components and MIT Lincoln Lab component to provide this IaaS Service for tenant.

## Project Goal Includes:

Provide an executable script, ansible playbook, for the provider that automatically installs and configures all components in this cloud deployment system.
Design an automated method to install each component on tenant’s environment
Configured each components’ connection based on the Bolted system schematics to allow interconnection and communication across each component.

## Background

The prevalence of public cloud offerings at various level including infrastructure, platform and software as a service have drawn much of the public’s attention to their security issues. Whereas most IaaS providers may have realized the imperative nature of this public concern, they are relatively indifferent to this aspect since the access to sensitive data is only limited to their own employees. This notion, however, can not be applied to a generally-defined public cloud where customers seek the privilege to secure their own data. On the premise of this demand, bolted system is proposed to serve those customers with higher security concerns.


###### Bolted System Skeleton
![alt text](https://github.com/BU-NU-CLOUD-SP18/Secure-Cloud-Automated-Deployment/blob/master/docs/bolted_architecture.png "Bolted System Architecture")

This picture represents the flow of events. The nodes are isolated with respect to their requirements and then moves the node into airlock state. There is an attestation test that takes place to compare the image with a white list and if it passes, then the node is forwarded to the tenant enclave, otherwise the node is passed on to the rejected pool.

###### Bolted System Components

There are four major components required to accomplish the goal of this project. These components are the base for any cloud, but we propose to modify the working a little to ensure more security in our system.

HIL (Hardware Isolation Layer)
HIL provides the capability of isolating the node in a physical layer instead of using a virtualized node. With this isolation in the cloud, it allows the nodes to share resources with different provisioning systems, including Ironic, Maas, and etc. Here, HIL can be used with little or almost no modification in the existing provisioning system, making it very dynamic in nature. [6] HIL is also used for attesting the nodes to a particular network.

BMI (Bare Metal Imaging)
BMI is a provisioning system that allows the hardware to boot remotely from a different datacenter. It saves the installation time of operating system and applications on the hardware by using a remote booting mechanism via PXE mechanism. [3]

KEYLIME (Attestation)
Keylime is a security authentication of each physical node for user while the node is deploying, provisioning and running. Keylime builds and works on TPM ( Trusted Platform Module)  to implement its attestation procedure. It provides higher integrity of the node, before and after provisioning thereby building trusted nodes for tenant’s cloud environment and service.[2]

Orchestration
To simplify the deployment procedure, orchestration engine automates the entire cloud deployment procedure from idle node to node in tenant cloud network. [?] Orchestration coordinate with all previous three components and to deploy a tenant enclave with reliable and simple IssA cloud service.

User Scope
For Bolted system, user is a provider who needs a secure enclave public cloud to provide to any tenant who is on immediate need of  a particular portion of the cloud, e.g. confidential facility, military facility etc. Therefore, this project also serves the same user group, since this is a feature of Bolted System. Here is the user case that applies to this project. 

As a provider for sny secure service to a tenant with the help of a Bolted system, I want the system to be user friendly and easy to implement without calling the MOC technical group for installation and configuration of each component separately.

Project Features and Solution

For this project, the features included are the following:
It allows the provider to install and configure the Bolted system without worrying about installation and configuration process for each component individually. 
Another feature it that the tenant or client can choose the location for those component, and they can even move the application to a different location even after they have installed it the first time.

To implement this, the project uses kubernetes containers as the installation media or environment instead of a VM. The reason is because a container is convenient and portable as we think about the project requirement. 

Acceptance Criteria (MVP)

An ansible playbook that is executable which can install and automate the process of installation of HIL, BMI, Keylime and the orchestration engine on the provider’s cloud environment. Our system should deliver a model that facilitates communication using containers implemented on all these components so as to facilitate communication amongst them  Now, separate installation and configuration of each component is not required.


## Mass Open Cloud

This project is part of the larger `Mass Open Cloud
<https://massopen.cloud/>`_. For a description of the team and other
information, see
`<https://github.com/CCI-MOC/moc-public/blob/master/README.md>`_.

## References
[1] Jason Hennessey , Sahil Tikale , Ata Turk , Emine Ugur Kaynar , Chris Hill , Peter Desnoyers , Orran Krieger, HIL: Designing an Exokernel for the Data Center, Proceedings of the Seventh ACM Symposium on Cloud Computing, October 05-07, 2016, Santa Clara, CA, USA

[2] Nabil Schear , Patrick T. Cable, II , Thomas M. Moyer , Bryan Richard , Robert Rudd, Bootstrapping and maintaining trust in the cloud, Proceedings of the 32nd Annual Conference on Computer Security Applications, December 05-08, 2016, Los Angeles, California, USA

[3] Ata Turk, Ravi S. Gudimetla, Emine Ugur Kaynar, Jason Hennessey, Sahil Tikale, Peter Desnoyers, and Orran Krieger. An experiment on bare-metal bigdata provisioning. In 8th USENIX Workshop on Hot Topics in Cloud Computing (HotCloud 16), Denver, CO, 2016. USENIX Association.

[4] Apoorve Mohan, Ata Turk, Ravi S. Gudimetla, Sahil Tikale, Jason Hennesey, Ugur Kaynar, Gene Cooperman, Peter Desnoyers,Orran Krieger, M2: Malleable Metal as a Service, arXiv:1801.00540 [cs.DC], Jan, 2018, USA.

[5]  Yushi Omote, Takahiro Shinagawa, and Kazuhiko Kato.  Improving agility and elasticity in bare-metal clouds.In ASP- LOS, 2015.

[6] Jason Hennessey, Sahil Tikale, Ata Turk, Emine Ugur Kaynar, Chris Hill, Peter Desnoyers, and Orran Krieger. 2016. HIL: Designing an Exokernel for the Data Center. In Proceedings of the Seventh ACM Symposium on Cloud Computing (SoCC '16), Marcos K. Aguilera, Brian Cooper, and Yanlei Diao (Eds.). ACM, New York, NY, USA, 155-168. 







