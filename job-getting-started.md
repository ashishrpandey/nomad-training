
## Running a Job

Run the command below to generate a sample job file (example.nomad)
    
      nomad job init

View the generated file       
      
      vim example.nomad

Run the job that starts a redis docker container  

    nomad job run example.nomad 
    
It shall fail with the output given below as docker is not installed 

      ... 
      Task Group "cache" (failed to place 1 allocation):
      * Constraint "missing drivers": 1 nodes excluded by filter
       ...
       
Install Docker and start the docker daemon 

    yum install docker  -y 
    service docker start     

Run the job again 

    nomad job run example.nomad 
    
Verify that the task is runnning by executing 

    docker ps 
    OR 
    nomad job status 
    
See the status of the job by running 

     nomad job status example
     OR 
     nomad status example
     
     





