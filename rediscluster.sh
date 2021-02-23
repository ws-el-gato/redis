#redis install to run cluster
sudo apt -y install gcc make
cd /usr/local/src
sudo wget http://download.redis.io/redis-stable.tar.gz
sudo tar xzf redis-stable.tar.gz
sudo rm redis-stable.tar.gz
cd redis-stable
sudo make distclean
sudo make
sudo mkdir /etc/redis
sudo chown ec2-user:ec2-user /etc/redis
sudo cp src/redis-server src/redis-cli /usr/local/bin

cd /usr/local/src/redis-stable/
redis-cli --cluster create 10.22.1.30:7000 10.22.1.30:7001 10.22.1.121:7000 10.22.1.121:7001 10.22.1.203:7000 10.22.1.203:7001 --cluster-replicas 1