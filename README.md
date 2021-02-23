Creating Redis cluster and adding a server to the existing cluster

Step-by-step guide
Created three ubuntu servers. In each server run the following commands

$sudo apt install git
$cd /home
sudo git clone https://github.com/ws-el-gato/redis.git (Redis for Ubuntu)
cd hhh.redis
sudo chmod +x redisbuild.sh
sudo chmod +x rediscluster.sh
sudo ./redisbuild.sh

Repeat these steps for each server created. All the servers should have two containers running with up status. To check the status run:

$sudo docker ps -a
Edit the rediscluster.sh with the appropriate IP address of the new servers created and save it. Also, comment on the following line

sudo chown ubuntu:ubuntu /etc/redis
now run

sudo ./rediscluster.sh


Troubleshooting: 

If while executing the sudo ./rediscluster.sh command  and get the following error 

Upon inspection, it was found that the server the Redis server it installed was of a higher version, and the GCC compiler version (4.8.5) is not compatible so a higher version of GCC need to be installed which was achieved by running the following commands
You will need to do the following to install a higher version of GCC


sudo apt install ubuntu-release-scl
 
sudo apt install devtoolset-7-gcc*
 
(now enable the temp bash shell )
 
$scl enable devtoolset-7 bash
 
// Edit the rediscluster.sh by adding a comment to: #sudo apt -y install gcc make //
 
// Run the following command //
 
sudo ./rediscluster.sh


Now the Redis cluster will be created. To check the Redis cluster nodes by running the following command



redis-cli -p 7000 cluster nodes
 ( will list all the nodes on that cluster)

Note

Note: Remember the redis-cli is installed only on the server where you run rediscluster.sh
Hence you will not be able to view the cluster-info from other nodes.
If you want to view from other nodes you need to run the rediscluster.sh on all servers using the above steps

