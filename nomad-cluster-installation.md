
Install the required package on server as well as client nodes by following this page. 

Connect to the both server as well as client. 
Do the steps below on *both the machines* 

    sudo su -
    sudo yum install -y yum-utils
    sudo yum-config-manager --add-repo https://rpm.releases.hashicorp.com/RHEL/hashicorp.repo
    
    

Edit the $releasever by 7 in the hashicorp.repo file 

    sudo sed -i s/\$releasever/7/g /etc/yum.repos.d/hashicorp.repo
    sudo yum -y install nomad
    
Also install Git and Docker and start docker daemon as we would need it later for running jobs.

    sudo yum install git docker -y 
    sudo service docker start 
    sudo service docker status 

## Verify the Installation

    PATH=$PATH:/usr/local/bin/
    nomad
    

## Clone the repository having config files on both the machines 

    git clone https://github.com/ashishrpandey/nomad-training
    cd nomad-training

## On the server 

Before launching Nomad, create a config file 
find the file here - 
https://github.com/ashishrpandey/nomad-training/blob/master/server-config.hcl

    nomad agent -config server-config.hcl

## On each Client



    git clone https://github.com/ashishrpandey/nomad-training
  
    
   Before launching Nomad, create a config file for the client1
- Modify the servers address by taking the *The Private IP of your Server* in the file - client1-config.hcl 
find the file here - 
https://github.com/ashishrpandey/nomad-training/blob/master/client1-config.hcl

   
    cd nomad-training
    vim client1-config.hcl
    
  Start the Nomad client
    
    nomad agent -config client1-config.hcl
    

## Verify the status of the cluster 

       $ nomad node status

## Verify by running jobs 

Schedule a job by running below command on the SERVER (not on the client)

    nomad job run example.nomad
    nomad status example
    
    
Observe that the jobs are schduled on the client node. YOu can verify it by running below command on the client machine - 

    docker ps 
    
## Open the web UI
On your web browser, open the link below 

http://public-ip-of-server:4646
        
- You shall be able to see the Nomad UI of the server 
    
    
    
