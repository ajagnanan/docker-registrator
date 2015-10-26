#!/bin/sh

hostip=`ifconfig eth0 | grep 'inet addr:' | cut -d: -f2 | awk '{ print $1}'`
cmd="/bin/registrator"
if [ -n "$CONSUL_INTERNAL" ]; then
  cmd="$cmd --internal"
fi
if [ -n "$CONSUL_RETRY_ATTEMPTS" ]; then
  cmd="$cmd -retry-attempts $CONSUL_RETRY_ATTEMPTS"
fi
if [ -n "$CONSUL_RETRY_INTERVAL" ]; then
  cmd="$cmd -retry-interval $CONSUL_RETRY_INTERVAL"
fi
if [ -n "$CONSUL_TAGS" ]; then
  cmd="$cmd -tags $CONSUL_TAGS"
fi
if [ -n "$CONSUL_DEREGISTER" ]; then
  cmd="$cmd -deregister $CONSUL_DEREGISTER"
fi
if [ -n "$CONSUL_TTL" ]; then
  cmd="$cmd -ttl $CONSUL_TTL"
fi
if [ -n "$CONSUL_TTL_REFRESH" ]; then
  cmd="$cmd -ttl-refresh $CONSUL_TTL_REFRESH"
fi
if [ -n "$CONSUL_RESYNC" ]; then
  cmd="$cmd -resync $CONSUL_RESYNC"
fi
if [ -n "$hostip" ]; then
  cmd="$cmd -ip $hostip"
fi

cmd="$cmd $CONSUL_HOST"
echo $cmd

eval "$cmd"
