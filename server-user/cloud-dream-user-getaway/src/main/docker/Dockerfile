#FROM frolvlad/alpine-oraclejdk8:slim
FROM frolvlad/alpine-oraclejre8:latest
VOLUME /tmp
ADD cloud-dream-user-getaway-0.0.1.jar app.jar
ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-jar","/app.jar"]
EXPOSE 8782