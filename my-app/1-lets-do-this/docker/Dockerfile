#First we tell Docker what base image we would like to use for our application.
FROM openjdk:17.0

#Next we need to copy our application files into our image.
WORKDIR /app
COPY ./my-app/1-lets-do-this/spring-petclinic/.mvn/ .mvn
COPY ./my-app/1-lets-do-this/spring-petclinic/mvnw ./
COPY ./my-app/1-lets-do-this/spring-petclinic/pom.xml ./
COPY ./my-app/1-lets-do-this/spring-petclinic/src ./src

# Once we have our files inside the image we can execute the maven command.
# This works exactly the same way as if we were running maven locally on our machine,
# but this time the dependencies will be installed into the image.
RUN ./mvnw dependency:resolve

# Now, all we have to do is to tell Docker what command we want to run when
# our image is executed inside a container.
CMD ["./mvnw", "spring-boot:run"]