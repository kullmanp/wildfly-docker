#!/bin/bash

## adapted from https://github.com/goldmann/wildfly-docker-configuration

JBOSS_HOME=/opt/jboss/wildfly
JBOSS_CLI=$JBOSS_HOME/bin/jboss-cli.sh

function wait_for_server() {
  until `$JBOSS_CLI -c "ls /deployment" &> /dev/null`; do
    sleep 1
  done
}

echo "=> Starting WildFly server"
$JBOSS_HOME/bin/standalone.sh > /dev/null &

echo "=> Waiting for the server to boot"
wait_for_server

echo "=> Executing the commands"
$JBOSS_CLI -c --file=`dirname "$0"`/commands.cli

echo "=> Shutting down WildFly"
$JBOSS_CLI -c ":shutdown"
