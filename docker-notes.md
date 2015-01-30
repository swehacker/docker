## Tips

Sources:

* [15 Docker Tips in 5 minutes](http://sssslide.com/speakerdeck.com/bmorearty/15-docker-tips-in-5-minutes)

### Remove old docker containers
```bash
docker ps -a | grep 'days ago' | awk '{print $1}' | xargs docker rm
```

### Last Ids

```
alias dl='docker ps -l -q'
docker run ubuntu echo hello world
docker commit `dl` helloworld
```

### Commit with command (needs Dockerfile)

```
docker commit -run='{"Cmd":["postgres", "-too -many -opts"]}' `dl` postgres
```

### Get IP address

```
docker inspect `dl` | grep IPAddress | cut -d '"' -f 4
```

or

```
wget http://stedolan.github.io/jq/download/source/jq-1.3.tar.gz
tar xzvf jq-1.3.tar.gz
cd jq-1.3
./configure && make && sudo make install
docker inspect `dl` | jq -r '.[0].NetworkSettings.IPAddress'
```

or (this is unverified)

```
docker inspect -f '{{ .NetworkSettings.IPAddress }}' <container_name>
```

### Get port mapping

```
docker inspect -f '{{range $p, $conf := .NetworkSettings.Ports}} {{$p}} -> {{(index $conf 0).HostPort}} {{end}}' <containername>
```

### Find containers by regular expression

```
for i in $(docker ps -a | grep "REGEXP_PATTERN" | cut -f1 -d" "); do echo $i; done`
```

### Get Environment Settings

```
docker run --rm ubuntu env
```

### Kill running containers

```
docker kill $(docker ps -q)
```

### Delete old containers

```
docker ps -a | grep 'weeks ago' | awk '{print $1}' | xargs docker rm
```

### Delete stopped containers

```
docker rm `docker ps -a -q`
```

### Delete dangling images

```
docker rmi $(docker images -q -f dangling=true)
```

### Delete all images

```
docker rmi $(docker images -q)
```

### Show image dependencies

```
docker images -viz | dot -Tpng -o docker.png
```

## Tools

* [Fig](https://github.com/wsargent/docker-cheat-sheet#fig)
* [Panamax](https://github.com/wsargent/docker-cheat-sheet#panamax)
* [Vessel](https://github.com/wsargent/docker-cheat-sheet#vessel)

### Fig

[Fig](http://www.fig.sh/) is a helper app that makes it easier to run multiple docker containers on the same host. I would expect it to be used during dev/qa more than in production.

Fig works with a ```fig.yml``` file (default name, use ```-f``` to provide a different filename)  that defines the containers you wish to use with it. Fig will take its project name from the name of the folder containing your yml configuration but you can override that with the ```-p``` parameter.

Once I have my config defined, I can use ```fig up -d``` to run it (the ```-d``` runs it as a background task). This will build (if required) start and link any containers.

You can do everything you do with fig using docker directly but running multiple containers with parameters would require some sort of script if you plan to do it more than once so the yml config of fig and the convenience commands it provides are worth considering.

Here's an example of setting up a ```fig.yml``` for an app with a apache packaged client container and a tomcat packaged app war:

First, here are the two docker commands to run these containers:
```
docker run -p 8080:8080 -v /Users/me/tomcatwork/trial.properties:/usr/share/tomcat6/trial.properties:rw -d me/tcfull 
docker run -p 80:80 -v /Users/me/dockerwork/localproxy.conf:/etc/apache2/conf-enabled/proxy.conf:rw -d me/afull
```
 at this point, I haven't linked the containers - I'm using the proxy.conf to specify the tomcat address.
my fig.yml looks like this:
```
app:
  image: me/tcfull
  ports:
    - "8080"
  volumes:
    - /Users/me/tomcatwork/trial.properties:/usr/share/tomcat6/trial.properties:rw
web:
  image: me/afull
  ports:
    - "80:80"
  volumes:
    - /Users/me/figwork/proxy.conf:/etc/apache2/conf-enabled/proxy.conf:rw 
  links:
    - app
```
As you can see it follows the docker commands with the addition of names for the containers and a links section for the web container, linking it to the app container.

As part of that linking process, docker will copy any environment variables defined in the app container over to the web container, define new environment variables for the address the app container is running at and also add an app entry in the etc/hosts file for the web container. I can modify my proxy conf to address ```http://app:8080``` and fig/docker will take care of the rest.

I can then use commands like ```fig stop``` and ```fig rm``` to stop all my containers and remove them.
NB - docker will [eventually](https://gist.github.com/aanand/9e7ac7185ffd64c1a91a) absorb figs functionality with docker groups and docker up but it looks like they're keeping the yml config so it should be pretty seamless when it happens.

#### Troubleshooting

```fig run``` is a useful command for debugging issues. It allows me to startup a named container (and any it links to) and run a one off command. 

This allows me to do things like ```fig run web env``` which will give me a list of all the environment variables that are available on the web container including the ones generated via the link to app. 

I can also use ```fig run web bash``` to run my web container interactively the way it has been setup by fig with the link to app so I can debug any issues from the command line.

### Panamax

* [Panamax](http://panamax.io/)

Nice web UI, will let you set up and download multiple docker containers.

### Vessel

* [Vessel](http://awvessel.github.io/)
