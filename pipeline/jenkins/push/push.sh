#!/bin/bash

echo "********************"
echo "** Pushing image ***"
echo "********************"

IMAGE="maven-project"

echo "** Logging in ***"
docker login -u ckalandar -p $PASS
echo "*** Tagging image ***"
docker tag $IMAGE:$BUILD_TAG ckalandar/$IMAGE:$BUILD_TAG
echo "*** Pushing image ***"
docker push ckalandar/$IMAGE:$BUILD_TAG
