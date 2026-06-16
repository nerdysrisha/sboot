# Ubuntu JDK - includes strings, gdb, and all debugging tools by default
FROM eclipse-temurin:22-jdk-jammy
WORKDIR /app

# Install gdb which includes gcore + Python 3.12.1 (added on 16 Jun)
RUN apt-get update && \
    apt-get install -y gdb software-properties-common && \
    add-apt-repository ppa:deadsnakes/ppa && \
    apt-get update && \
    apt-get install -y python3.12 python3.12-venv python3.12-full python3-pip && \
    rm -rf /var/lib/apt/lists/*

COPY target/payments-0.0.1-SNAPSHOT.jar app.jar

# Enable heap dumps and debugging
ENV JAVA_OPTS="-XX:+HeapDumpOnOutOfMemoryError -XX:HeapDumpPath=/app/heapdumps -XX:+PreserveFramePointer"

# Create directories for dumps
RUN mkdir -p /app/heapdumps /app/coredumps

ENTRYPOINT ["sh", "-c", "java $JAVA_OPTS -jar app.jar"]
EXPOSE 8080