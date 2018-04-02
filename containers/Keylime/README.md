## Keylime Container

Keylime contianer images contains a working Keylime installed in an Ubuntu Xenial environment, which can be deployed to container.

Since Keylime needs three different services to perform the monitoring functionaility, which are Keylime Verifier, Keylime Registrar and Keylime Client Node. Once all these services are running, Keylime can monitoring the tpm module by Verifier and Registrar. Therefore, on client side, a Keylime container needs to run client service.

Keylime Registrar and Keylime Verifier needs to be run first before running Keylime Client Node, since Keylime Client Node needs to connect to Registrar and Verifier to finish its registration process.

#### Local Test

This test is test the communication between each componentof Keylime.
