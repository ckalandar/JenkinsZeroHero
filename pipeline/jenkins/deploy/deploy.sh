#!/bin/bash

echo maven-project > /tmp/.auth
echo $BUILD_TAG >> /tmp/.auth
echo $PASS >> /tmp/.auth

scp -i /opt/prod /tmp/.auth jenkins@192.168.11.142:/tmp/.auth
scp -i /opt/prod ./jenkins/deploy/publish jenkins@192.168.11.142:/tmp/publish
ssh -i /opt/prod jenkins@192.168.11.142 "/tmp/publish"
