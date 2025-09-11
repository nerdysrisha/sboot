#This project deals with 'resource limits for pods' Refer Deployment yaml for more clarity. 

##SPRING BOOT HELLO WORLD - DOCKER - AKS START

cd C:\ws\sboot\lab063
mvn clean package
java -jar .\target\hworld-0.0.1-SNAPSHOT.jar
curl http://localhost:8080
docker build -t hworld063:latest .
docker run -p 8080:8080 hworld063:latest
docker container list
curl http://localhost:8080
docker tag hworld063:latest nerdysrisha/hworld063:latest
docker push nerdysrisha/hworld063:latest
kubectl create namespace integrations
kubectl config set-context --current --namespace=integrations
kubectl apply -f deployment.yaml
kubectl get all
kubectl port-forward svc/hworld-service -n integrations 8080:8080
curl http://localhost:8080
