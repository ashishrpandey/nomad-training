
Install mysql-client 


    sudo yum install mysql
 
 Create a target directory
 
    sudo mkdir -p /opt/mysql/data
 
  - Restart the client node with the new config file containing volume details in the client stanza 
  - (Before that make sure that the server address is properly modified in the file client1-config-withhost-volume.hcl)
  
        nomad agent -config=client1-config-withhost-volume.hcl

Launch the job (from Server node)
 
    nomad job run mysql.nomad
    
Wait for a while, then go to nomad client 
 - Check the content of /opt/mysql/data/ on the client node 
 - Multiple files would be created by mysql. 
 - Create a dummy file - ashish.txt in /opt/mysql/data/
 
       touch ashish.txt
 
 Look at the corresponding container id at the client node

    docker ps 

Check the content of the /var/lib/mysql inside the cotnainer

    docker exec -it <CONTAINER-ID> ls /var/lib/mysql
    
OR you can inspect docker to check at the volume

    docker inspect <CONTAINER-ID>
 
You shall see the file ashish.txt in the result of above command. 



 

 
 
