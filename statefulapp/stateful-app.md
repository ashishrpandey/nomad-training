
Install mysql-client 


 sudo yum install mysql
 
 Create a target directory
 
 $ sudo mkdir -p /opt/mysql/data
 
 
 Check the content of /opt/mysql/data/ on the client node 
 Multiple files would be created by mysql. 
 Create a dummy file - ashish.txt in /opt/mysql/data/
 
    touch ashish.txt
 
 Look at the corresponding container id at the client node

    docker ps 

Check the content of the /var/lib/mysql inside the cotnainer

    docker exec -it <CONTAINER-ID> ls /var/lib/mysql

You shall see the file ashish.txt in the result of above command. 



 

 
 
