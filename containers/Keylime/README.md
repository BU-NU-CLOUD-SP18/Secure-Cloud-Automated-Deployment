# Keylime Container

Keylime contianer images contains a working Keylime installed in an Ubuntu Xenial environment, which can be deployed to container.

Since Keylime needs three different services to perform the monitoring functionaility, which are Keylime Verifier, Keylime Registrar and Keylime Client Node. Once all these services are running, Keylime can monitoring the tpm module by Verifier and Registrar. Therefore, on client side, a Keylime container needs to run client service.

Keylime Registrar and Keylime Verifier needs to be run first before running Keylime Client Node, since Keylime Client Node needs to connect to Registrar and Verifier to finish its registration process.

#### Build Image 

Use this Docker file to  build a docker container image with ```NAME``` called ```keylime``` and uses the current directory ```.``` as ```PATH``` of the container. (Use ```sudo``` for docker in Kaizen.)
```
$ docker build -t keylime .
```

## Test
#### Keylime Test
Run the following command to run this test. I will ran the ```latest``` keylime image in a docker container. (Use ```sudo``` for docker in Kaizen.)
```
$ docker run -t keylime:latest
```
This test runs a keylime image and it will display the test program ```run_test.sh``` to test all the components, Keylime registrar, Keylime verifier, Keylime client node, by running a sequence of unittests. Result of the test will display the outcome of the performance inside the container.
#### Local Connection Test
This test is test the communication between each componentof Keylime inside docker. ```keylime.conf``` is changed for the following test with the associated network ip for each component.

Frist create a subnet in docker with name called ```mynet``` and ip address of ```172.18.0.0/24``` that is used for the communication between each container. (Use ```sudo``` for docker in Kaizen.)
```
$ docker network create --subnet=172.18.0.0/24 mynet
```
Then run the Keylime image in a container assigned with ip address ```172.18.0.10``` inside the docker subnet. This contianer uses ```run.sh``` to open Keylime registrar and Keylime verifier service for Keylime client, which has to be initialized before running Keylime client node.
```
$ docker run --net mynet --ip 172.18.0.10 -t keylime:latest bash "run.sh"
```

Then run another container inside the same subnet and run Keylime client node that communicate with registrar and verifier to bulid the keylime component connection.
```
$ sudo docker run --net mynet --ip 172.18.0.11 -t keylime:latest bash '-c' "init_tpm_server; tpm_serverd; python ../keylime/cloud_node.py"
```

At this point if UUID of client node occurs at registrar/verifier container, which means the connection is built successfully and the test is pass.



