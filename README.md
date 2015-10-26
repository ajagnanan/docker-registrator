Registrator Docker Image
=========================

This container attempts to find the correct ip of the host before starting registrator. It also allows you to override the shell script
thats run in order for you to override it per environment.

## Shell script

```
hostip=`ifconfig eth0 | grep 'inet addr:' | cut -d: -f2 | awk '{ print $1}'`
```

## Using the container

```
$ docker run -d \
    --net=host \
    --volume=/var/run/docker.sock:/tmp/docker.sock \
    -e CONSUL_HOST=consul://localhost:8500 \
    ajagnanan/docker-registrator
```

## Environment variables
CONSUL_INTERNAL=true
CONSUL_RETRY_ATTEMPTS=x
CONSUL_RETRY_INTERVAL=x
CONSUL_TAGS=x,x
CONSUL_DEREGISTER=x
CONSUL_TTL=x
CONSUL_TTL_REFRESH=x
CONSUL_RESYNC=x
