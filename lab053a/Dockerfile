# Single stage - much simpler
FROM eclipse-temurin:22-jre-alpine
WORKDIR /app
COPY target/hworld-0.0.1-SNAPSHOT.jar app.jar
ENTRYPOINT ["java", "-jar", "app.jar"]
EXPOSE 8080