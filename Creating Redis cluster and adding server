Creating Redis cluster and adding server to the existing cluster

The main purpose of this is article is to document how the redis cluster was created  and then how we can add node to the built cluster



Create a Redis Cluster

 created three ubuntu servers
 In each server run the following commands
$sudo apt install git
$cd /home
sudo git clone https://github.com/mediwareinc/hhh.redis.git  (clone hhh-redis git repo)
cd hhh.redis 
sudo chmod +x redisbuild.sh
sudo chmod +x rediscluster.sh
sudo ./redisbuild.sh
Repeat steps 3-9 for each servers created
at this point all the servers should have two containers running  with up status ( $sudo docker ps -a)
setting up a cluster  
in any one of the cluster server edit the rediscluster.sh with the appropriate ip address of the new servers created and save it
also comment the following line (sudo chown ec2-user:ec2-user /etc/redis )
 now run sudo ./rediscluster.sh


while executing this command sudo ./rediscluster.sh the error was thrown

upon inspection it was found that the server the redisserver it installed was of higher version and the gcc compiler version (4.8.5) is not compatible so a higher version of gcc need to be installed which was achieved by running the following commands



$sudo apt install ubuntu-release-scl

$sudo apt install devtoolset-7-gcc*

(now enable the temp bash shell )

$scl enable devtoolset-7 bash

edit the  rediscluster.sh by adding a comment to ( #sudo apt -y install gcc make)

Run the following command

sudo ./rediscluster.sh



Now the redis cluster will be created 

check the redis cluster nodes by running the following command 

$redis-cli -p 7000 cluster nodes ( will list all the nodes on that cluster)



Note: Remember the redis-cli is installed only on the server where you run rediscluster.sh
 hence you will not be able to view the cluster info from other nodes. 
 if you want to view from other nodes you need to run the rediscluster.sh on all servers using the above steps



Adding server to the existing  cluster 

hhhdevredis04.austin.kinnser.com was created with the ip address 10.12.13.214

Steps 3-9 were repeated for this server as well 

after the docker containers are up on this we added this to the above cluster

login to existing cluster server where you can execute the redis-cli command

Then execute the following command

$redis-cli --cluster add-node 10.12.13.214:7000 10.12.13.213:7000

##{  redis-cli --cluster add-node  <new-node-ip:7000> <existing-node-ip:7000> }

#add for the other port

$redis-cli --cluster add-node 10.12.13.214:7001 10.12.13.213:7001

##{  redis-cli --cluster add-node  <new-node-ip:7000> <existing-node-ip:7000> }

verify you  can see all the nodes in cluster by running the following command

$redis-cli -p 7000 cluster nodes