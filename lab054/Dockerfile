#Here we are using amazon linux which is kind of 'redhat' style and NOT DEBIAN.
#Some commands are to be specific to that.

FROM amazoncorretto:22
LABEL version="1.0"

WORKDIR /app
COPY target/hworld-0.0.1-SNAPSHOT.jar /app/hworld-0.0.1-SNAPSHOT.jar

# Make JAR and directory read-only and owned by root
RUN chown -R root:root /app && chmod 555 /app && chmod 444 /app/hworld-0.0.1-SNAPSHOT.jar

# Switch to a non-root user by UID/GID directly (no need for useradd)
USER 1000:1000

EXPOSE 8080
ENTRYPOINT ["java", "-jar", "hworld-0.0.1-SNAPSHOT.jar"]

