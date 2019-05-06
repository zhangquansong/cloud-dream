#FROM frolvlad/alpine-oraclejdk8:slim
FROM frolvlad/alpine-oraclejre8:latest
VOLUME /tmp
ADD cloud-dream-version-getaway-0.0.1-SNAPSHOT.jar app.jar
ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-jar","/app.jar"]
EXPOSE 8783