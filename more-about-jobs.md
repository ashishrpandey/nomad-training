I assume you have already executed 

    nomad job run example.nomad

Get more details about job by executing - 

    nomad status example
  
Get more details about allocation

    $ nomad alloc status <job-id>

 To see the logs of a task, use the alloc logs command:
 
    $ nomad alloc logs <job-id> redis

    
