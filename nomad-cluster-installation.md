
Install the required package on server as well as client nodes by following this page. 

https://github.com/ashishrpandey/nomad-training/blob/master/nomad-installation.md

## On the server 

Before launching Nomad, create a config file 
find the file here - 

https://github.com/ashishrpandey/nomad-training/blob/master/server-config.hcl

    nomad agent -config server-config.hcl

## On each Client

Before launching Nomad, create a config file for the client1
find the file here - 
https://github.com/ashishrpandey/nomad-training/blob/master/client1-config.hcl

    nomad agent -config client1-config.hcl
    

## Verify the status of the cluster 

$ nomad node status

