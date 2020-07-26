
The below command will provide eval-id 

    nomad job eval <job-id>

Find the success/failure of the evaluation

    nomad eval  status <eval-id>

Create a new evaluation

    nomad job eval -detach job1

Evaluate the job with ID "job1", and reschedule any eligible failed allocations:

    nomad job eval -force-reschedule job1
