# Redis for Debian/Ubuntu based
sudo apt update -y
sudo apt install -y docker
sudo service docker start

# stop all docker instances
sudo docker stop $(docker ps)
# remove all instances
sudo docker rm $(docker ps -a -q)
# remove all images
sudo docker rmi $(docker images)

# create a redis.conf file
echo "port 7000" > redis.conf
echo "cluster-enabled yes" >> redis.conf
echo "cluster-config-file nodes.conf" >> redis.conf
echo "cluster-node-timeout 5000" >> redis.conf
echo "appendonly no" >> redis.conf
echo "loglevel notice" >> redis.conf
echo "logfile '/var/www/logs/redis.log'" >> redis.conf

# create Docker file
echo "FROM redis" > Dockerfile
echo "COPY redis.conf /usr/local/etc/redis/redis.conf" >> Dockerfile
echo "RUN mkdir -p /var/www/logs/ && touch /var/www/logs/redis.log" >> Dockerfile
echo "RUN chmod -R 777 /var/www/logs/redis.log" >> Dockerfile
echo "CMD [ \"redis-server\", \"/usr/local/etc/redis/redis.conf\" ]" >> Dockerfile

sudo mkdir -p /var/www/logs/redis7000/ && touch /var/www/logs/redis7000/redis.log
sudo chmod -R 777 /var/www/logs/redis7000/redis.log

sudo mkdir -p /var/www/logs/redis7001/ && touch /var/www/logs/redis7001/redis.log
sudo chmod -R 777 /var/www/logs/redis7001/redis.log

# build Docker images; change redis.conf file on each iteration
sudo docker build -t redis7000 .

sed -i -e 's/port 7000/port 7001/g' redis.conf
sudo docker build -t redis7001 .

sed -i -e 's/port 7001/port 7000/g' redis.conf

# run docker images
sudo docker run --name redis7000 --expose 17000-17005 -d -p 7000:7000 -p 17000:17000 -v /var/www/logs/redis7000/:/var/www/logs/ --net=host  redis7000
sudo docker run --name redis7001 --expose 17000-17005 -d -p 7001:7001 -p 17001:17001 -v /var/www/logs/redis7001/:/var/www/logs/ --net=host  redis7001