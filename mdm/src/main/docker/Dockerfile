FROM openjdk:8-jre-slim
VOLUME /tmp
ADD mdm.jar mdm.jar
RUN bash -c 'touch /mdm.jar'
EXPOSE 8083
ENTRYPOINT [ "java", "-Djava.security.egd=file:/dev/./urandom", "-jar", "/mdm.jar" ]
