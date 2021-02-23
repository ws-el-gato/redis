<div align="center" id="top"> 
  <img src="./.github/app.gif" alt="Redis" />

  &#xa0;

  <!-- <a href="https://redis.netlify.app">Demo</a> -->
</div>

<h1 align="center">Redis</h1>

<p align="center">
  <img alt="Github top language" src="https://img.shields.io/github/languages/top/ws-el-gato/redis?color=56BEB8">

  <img alt="Github language count" src="https://img.shields.io/github/languages/count/ws-el-gato/redis?color=56BEB8">

  <img alt="Repository size" src="https://img.shields.io/github/repo-size/ws-el-gato/redis?color=56BEB8">

  <img alt="License" src="https://img.shields.io/github/license/ws-el-gato/redis?color=56BEB8">

  <!-- <img alt="Github issues" src="https://img.shields.io/github/issues/ws-el-gato/redis?color=56BEB8" /> -->

  <!-- <img alt="Github forks" src="https://img.shields.io/github/forks/ws-el-gato/redis?color=56BEB8" /> -->

  <!-- <img alt="Github stars" src="https://img.shields.io/github/stars/ws-el-gato/redis?color=56BEB8" /> -->
</p>

<!-- Status -->

<!-- <h4 align="center"> 
	🚧  Redis 🚀 Under construction...  🚧
</h4> 

<hr> -->

<p align="center">
  <a href="#about">About</a> &#xa0; | &#xa0; 
  <a href="#Install">How to install</a> &#xa0; | &#xa0;
  <a href="https://github.com/ws-el-gato" target="_blank">Author</a>
</p>

<br>

## About ##

The main purpose of this is article is to document how the redis cluster was created  and then how we can add node to the built cluster
## How to install Redis ##

In each server run the following commands

```bash 
$ sudo apt install git 
cd /home 
sudo git clone https://github.com/ws-el-gato/redis.git (Redis for Ubuntu) 
cd redis 
sudo chmod +x redisbuild.sh 
sudo chmod +x rediscluster.sh 
sudo ./redisbuild.sh
```

Repeat these steps for each server created. All the servers should have two containers running with up status. To check the status run:

```sudo docker ps -a```

Edit the rediscluster.sh with the appropriate IP address of the new servers created and save it. Also, comment on the following line

```$ sudo chown ubuntu:ubuntu /etc/redis ```

now run

```$ sudo ./rediscluster.sh```


## :checkered_flag: Starting ##
In each server run the following commands

```bash
$ sudo apt install git
$ git clone https://github.com/ws-el-gato/redis

# Access
$ cd redis

# Install dependencies
$ yarn

# Run the project
$ yarn start

# The server will initialize in the <http://localhost:3000>
```

## :memo: License ##

This project is under license from MIT. For more details, see the [LICENSE](LICENSE.md) file.


Made with :heart: by <a href="https://github.com/ws-el-gato" target="_blank">{{YOUR_NAME}}</a>

&#xa0;

<a href="#top">Back to top</a>
