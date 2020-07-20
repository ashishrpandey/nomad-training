I assume you have already executed 

    nomad job run example.nomad

Get more details about job by executing - 

    nomad status example
  
Get more details about allocation

    $ nomad alloc status <job-id>

 To see the logs of a task, use the alloc logs command:
 
    $ nomad alloc logs <job-id> redis

    
## Modifying a Job

- A job can be modified to
    - Scale-in or scale-out
    - Version upgrade of the application
    - Configuration changes 
    
- Modify the example.nomad file and then use the job plan command to invoke a dry-run of the scheduler to see what would happen if you ran the updated job:
    
       $ nomad job plan example.nomad
 Job plan also provides check-index, this can be used to make sure that whatever came as plan output, only those resourses shall be created. To make sure execute below-
 
      $nomad job run -check-index <job modify index> example.nomad


## Stopping a Job

    $ nomad job stop example

 
