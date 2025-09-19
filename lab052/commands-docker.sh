#This is just the docker build and local run

cd C:\ws\sboot\lab052
mvn clean package
java -jar .\target\hworld-0.0.1-SNAPSHOT.jar
curl http://localhost:8080
docker build -t hworld:latest .
docker run -p 8080:8080 hworld:latest
curl http://localhost:8080