## On Amazon Linux - 

    sudo su -
    sudo yum install -y yum-utils
    sudo yum-config-manager --add-repo https://rpm.releases.hashicorp.com/RHEL/hashicorp.repo

Edit the $releasever by 7 in the hashicorp.repo file 

    sudo yum -y install nomad
    
Also install Docker and start docker daemon as we would need it later for running jobs.

    sudo yum install docker -y 
    sudo service docker start 
    sudo service docker status 

## Verify the Installation

    PATH=$/usr/local/bin/
    nomad
    
# Start the Nomad agent in dev mode

    sudo nomad agent -dev

- Keep it running on this terminal/screen. 
- Open another terminal on the same machine and exucute - 


      $sudo su - 
      $nomad node status
      ID        DC   Name                                             Class   Drain  Eligibility  Status
      1686998b  dc1  ip-172-31-46-86.ap-southeast-1.compute.internal  <none>  false  eligible     ready

    
- View the members of the gossip ring using the command - 
      
      nomad server members 
      OR 
      nomad server members -detailed 
    
      
      


    
