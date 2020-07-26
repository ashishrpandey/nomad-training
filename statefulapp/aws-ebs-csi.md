Install mysql-client

      $ sudo yum install mysql

The AWS EBS plugin requires
- a controller plugin to coordinate access to the EBS volume - plugin-ebs-controller.nomad, and 
- node plugins to mount the volume to the EC2 instance. plugin-ebs-nodes.nomad

You'll create a controller job as a nomad service job and the node job as a Nomad system job.


      nomad job run plugin-ebs-controller.nomad
      nomad job run plugin-ebs-nodes.nomad


Check the status of plugin 

    nomad job status
   
    nomad plugin status aws-ebs0
    
   
## Register the volume

    nomad volume register csi-volume.hcl
    




