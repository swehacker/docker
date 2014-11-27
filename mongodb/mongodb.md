# How to setup and use docker

## Why
Docker will help us to setup new databases quickly, take down old and have different versions to test with. Docker makes it really easy to manage containers, and if something fails you can just start fresh with a new container.

## Prereq
You need to install docker which you can find at [Docker]. Docker is using Linux containers but has been ported to windows and OS X, but for OS X and Windows docker is run in a virtual machine. Please refer to the docker website how to install docker on your machine.

If you are having problems with OS X you can go to the trouble shooting section.

### HEADS UP
I have omitted `sudo`from the commands because it is used on Linux but not on OS X.

## First time
Go to this directory and run the following command to build the mongodb image
```
docker build -t ssdf/mongodb .
```
With this we will create a new container by run the following command:
```
docker run -d -p 27017:27017 --name ssdf-mongodb ssdf/mongodb
```
This will start a new container called ssdf-mongodb from the image we just created called ssdf/mongodb. It will also tell the docker to forward the port 27017 so we can connect with a client (mongo) and run it as a daemon. If you want to play around and see what is happening you can change the `-d` to an `-i` (interactive) which will send the output as if you run the command in bash.

## Start and stop the container
When the container is setup it is easy to start/stop the container with the commands `docker start <container>` and `docker stop <container>`

## Trouble shooting

### Logging
You can connect to the container to find out what is happening by issuing:
```
docker logs ssdf-mongodb
```
`docker logs` will give you some suggestions about different options like tail.

### Virtual Machine Users (OS X boot2docker)
For virtual machines you can not connect to the docker app directly because the virtual machine is running on a virtual network. You need to use the virtual machines IP adress and not localhost or the host ip adress.
If you run the following for OS X users
```
boot2docker ip
```

this will produce a result like
```
The VM's Host only interface IP address is: 192.168.59.103
```
Now you can use e.g. mongodb client to access your server
```
mongo <yourip>
```

If this still does not work you have to tell the virtual machine to NAT your port to the IP by take down the VM first:
```
boot2docker down
```

and tell the VM to NAT your internal VM port to the external virtual interface.
```
VBoxManage modifyvm "boot2docker-vm" --natpf1 "guestmongodb,tcp,127.0.0.1,27017,,27017"
```

To try it out you need to bring the VM up and also start the docker container.
```
boo2docker up
docker start ssdf-mongodb
```

[Docker]: http://docker.io
