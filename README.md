**Bolted System: Secure Cloud Automated Deployment**
=========================

**Team members:**

Vidya Anandamurali

Pei Jia

Yuxi Jiang

Jiangnan Zou

## **Background**

The prevalence of public cloud offerings at various level including infrastructure, platform and software as a service have drawn much of the public’s attention to their security issues. Whereas most IaaS providers may have realized the imperative nature of this public concern, they are relatively indifferent to this aspect since the access to sensitive data is only limited to their own employees. This notion, however, can not be applied to a generally-defined public cloud where customers seek the privilege to secure their own data. On the premise of this demand, bolted system is proposed to serve those customers with higher security concerns.

Bolted system is designed to carve an enclave cloud network through public cloud. By integrating this system, Bolted system is able to provide customers with a secure, elastic, scalable, flexible and user-friendly enclave cloud network. Security assurance is applied not just to the firmware of the physical machine, but also to the operating system, application and generally any software that runs on the machine.

As a system containing multiple parts of components, the security service provided by it is further enhanced by automating the process through orchestration. This is achieved by designing an extra orchestration engine which automatically coordinates each component to carry out a sequence of operations which finally yield a secure node for tenants.

## System Components

There are four major components required to accomplish the goal of this project. These components are the base for any cloud, but we propose to modify the working a little to ensure more security in our system.

#### **HIL (Hardware Isolation Layer)**

HIL provides the capability of isolating the node in a physical layer instead of using a virtualized node. With this isolation in the cloud, it allows the nodes to share resources with different provisioning systems, including Ironic, Maas, and etc. Here, HIL can be used with little or almost no modification in the existing provisioning system, making it very dynamic in nature. [6]

#### **BMI (Bare Metal Imaging)**

BMI is a provisioning system that allows the hardware to boot remotely from a different datacenter. It saves the installation time of operating system and applications on the hardware by using a remote booting mechanism via PXE mechanism. [3]

#### **KEYLIME (Attestation)**

Keylime is a security authentication of each physical node for user while the node is deploying, provisioning and running. Keylime builds and works on TPM ( Trusted Platform Module)  to implement its attestation procedure. It provides higher reliability and trusted nodes for tenant’s cloud environment and service.[2]

#### **Orchestration**

To simplify the deployment procedure, orchestration engine automates the entire cloud deployment procedure from idle node to node in tenant cloud network. [?] Orchestration coordinate with all previous three components and to deploy a tenant enclave with reliable and simple IssA cloud service.

The various components in the bolted system, unlike a conventional cloud has an orchestration engine that manages the transactions that take place between the HIL, BMI and Keylime. This orchestration process helps in providing an automated way to get a secure node. The orchestration engine facilitates the isolation, provisioning and attestation service and is responsible to take the node out of airlock once one cycle of the procedure is over. When a node is accepted or rejected, the next request to either of the three services is requested by the orchestration engine. It also performs the process of installing an OS on the new node. This way, the system is automated in such a way that any node can be accessed remotely and can be configured by the tenants with respect to their demand and requirement. Orchestration helps in providing a more transparent system that helps to save lot of expenses as well as elevates business agility. [5]

In order to implement this system, NERF firmware was burnt into the current system’s ROM. The original content was read and required parts were extracted from the server to include in the NERF firmware. This required the physical access to the server, as it would take longer time if we didn’t incorporate it. [4]

## **Benefit**

The benefits of the bolted architecture are flexibility and trust. By design, the architecture of bolted is extremely flexible where tenants can deploy their own instances of the components or use the ones deployed by the cloud provider. Also, this system is elastic and allows one to create their own cloud and use it for a small period of time, hence making it very efficient and economical for smaller institutions. 

## **References**

**[1]** Jason Hennessey , Sahil Tikale , Ata Turk , Emine Ugur Kaynar , Chris Hill , Peter Desnoyers , Orran Krieger, HIL: Designing an Exokernel for the Data Center, Proceedings of the Seventh ACM Symposium on Cloud Computing, October 05-07, 2016, Santa Clara, CA, USA

**[2]** Nabil Schear , Patrick T. Cable, II , Thomas M. Moyer , Bryan Richard , Robert Rudd, Bootstrapping and maintaining trust in the cloud, Proceedings of the 32nd Annual Conference on Computer Security Applications, December 05-08, 2016, Los Angeles, California, USA

**[3]** Ata Turk, Ravi S. Gudimetla, Emine Ugur Kaynar, Jason Hennessey, Sahil Tikale, Peter Desnoyers, and Orran Krieger. An experiment on bare-metal bigdata provisioning. In 8th USENIX Workshop on Hot Topics in Cloud Computing (HotCloud 16), Denver, CO, 2016. USENIX Association.

**[4]** Apoorve Mohan, Ata Turk, Ravi S. Gudimetla, Sahil Tikale, Jason Hennesey, Ugur Kaynar, Gene Cooperman, Peter Desnoyers,Orran Krieger, M2: Malleable Metal as a Service, arXiv:1801.00540 [cs.DC], Jan, 2018, USA.

**[5]**  Yushi Omote, Takahiro Shinagawa, and Kazuhiko Kato.  Improving agility and elasticity in bare-metal clouds.In ASP- LOS, 2015.

**[6]** Jason Hennessey, Sahil Tikale, Ata Turk, Emine Ugur Kaynar, Chris Hill, Peter Desnoyers, and Orran Krieger. 2016. HIL: Designing an Exokernel for the Data Center. In Proceedings of the Seventh ACM Symposium on Cloud Computing (SoCC '16), Marcos K. Aguilera, Brian Cooper, and Yanlei Diao (Eds.). ACM, New York, NY, USA, 155-168. 

