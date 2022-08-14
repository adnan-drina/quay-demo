#!/bin/bash

# load environment variables
source ~/.quay-demo.env

echo "****************************************************************************"
echo "We have an existing Spring Boot Java application, which we now want to package in a container."
echo "****************************************************************************"
echo "$(tput bold)Test the application without Docker$(tput sgr0)"
echo "In this step, we will test the application locally without Docker,"
echo "before we continue with building and running the application with Docker."
echo "This requires us to have Maven and Java OpenJDK version 15 or later installed on our machine."
echo "$(tput bold)./mvnw spring-boot:start$(tput sgr0)"
cd ./my-app/1-lets-do-this/spring-petclinic
./mvnw spring-boot:start
echo ""
echo "http://localhost:8080"
echo ""
read -p "Press enter to continue"

echo "****************************************************************************"
echo "Stopping local app"
echo "****************************************************************************"
./mvnw spring-boot:stop
cd ../../../
echo "Spring Boot application stopped"
echo ""

echo "****************************************************************************"
echo "We will now continue to build and run our application in container using Docker."
echo "****************************************************************************"
echo "$(tput bold)Create a Dockerfile for Java$(tput sgr0)"
echo "A Dockerfile is a text document that contains the instructions to assemble a Docker image."
echo "When we tell Docker to build our image by executing the docker build command,"
echo "Docker reads these instructions, executes them, and creates a Docker image as a result."
echo "****************************************************************************"
echo "Let's take a look at our first Dockerfile"
echo "****************************************************************************"
read -p "Press enter to continue"

echo "$(tput bold)cat ./Dockerfile$(tput sgr0)"
cat ./my-app/1-lets-do-this/docker/Dockerfile
echo ""
read -p "Press enter to continue"

##################################################################################
#Prebake images and store them on quay.io
##################################################################################

echo "****************************************************************************"
echo "Now that we’ve created our Dockerfile, let’s build our image. 300 sec"
echo "****************************************************************************"
echo "$(tput bold)docker build --tag java-docker .$(tput sgr0)"
docker build --tag java-docker -f ./my-app/1-lets-do-this/docker/Dockerfile .
echo ""
echo "Let's check local images to see if our image is indeed created."
read -p "Press enter to continue"

echo "$(tput bold)Local images$(tput sgr0)"
docker images | grep java-docker
echo ""
read -p "Press enter to continue"

echo "****************************************************************************"
echo "Our newly created container image contains only the current version of"
echo "our Java application. As we continue working on our application and"
echo "compiling new versions, we'll also continuously build new versions of our"
echo "container image. So how can we differentiate between multiple versions"
echo "of our container image?"
echo ""
echo "We'll use image tags for this. An image tag is a label applied to a container"
echo "image in a repository that distinguishes a specific image from other"
echo "images in an image stream."
echo "****************************************************************************"
read -p "Press enter to continue"

echo "$(tput bold)docker tag java-docker:latest $QUAY_SERVER/$QUAY_USER/java-docker:openjdk17$(tput sgr0)"
docker tag java-docker:latest $QUAY_SERVER/$QUAY_USER/java-docker:openjdk17
echo "Image tagged!"
docker images | grep java-docker
echo ""
echo "We now have a new tag for our image."
echo "We have not created a new image, the tag points to the same image. But"
echo "if our latest tag gets overwritten later, the new openjdk17 tag will remain"
echo "and point to our container image."
echo ""
echo "NOTE: We have also prepared this image tag for a push to our Quay"
echo "repository by adding the Quay server and user details to the container"
echo "image name."
read -p "Press enter to continue"

echo "****************************************************************************"
echo "Before we push our container to the registry, let's test it locally."
echo "****************************************************************************"
echo "$(tput bold)Run your image as a container$(tput sgr0)"
echo "To run an image inside a container, we use the docker run command."
echo "The docker run command requires one parameter which is the name of the image."
echo "Let’s start our image and make sure it is running correctly."
echo "****************************************************************************"
echo "$(tput bold)docker run --rm -d -p 8080:8080 --name springboot-server java-docker$(tput sgr0)"
docker run --rm -d -p 8080:8080 --name springboot-server java-docker
docker ps
echo "Our container is running, but we'll have to wait 180 sec on Spring Boot to become ready."
echo "waiting ..."
sleep 180
curl --request GET \
--url http://localhost:8080/actuator/health \
--header 'content-type: application/json'
echo "Our Spring Boot Java application is up and running in a container!"
read -p "Press enter to continue"

echo "Stopping local containers before we continue further"
docker stop springboot-server

echo "****************************************************************************"
echo "Now we can store our container image in our Quay container registry and"
echo "make it available for further deployments and Kubernetes consumption."
echo "****************************************************************************"
read -p "Press enter to continue"

echo "$(tput bold)Login to Quay$(tput sgr0)"
echo "First, we'll have to log in to our Quay repository using the docker login"
echo "command and developer credentials."
echo "$(tput bold)docker login $QUAY_SERVER -u $QUAY_USER -p $QUAY_PASS$(tput sgr0)"
docker login $QUAY_SERVER -u $QUAY_USER -p $QUAY_PASS
read -p "Press enter to continue"

echo "$(tput bold)Push to Quay$(tput sgr0)"
echo "Now we can push our image from our laptop to the Quay server using the"
echo "docker push command."
echo "$(tput bold)docker push $QUAY_SERVER/$QUAY_USER/java-docker:latest$(tput sgr0)"
echo "Image successfully pushed to Quay"
echo "http://${QUAY_SERVER}"