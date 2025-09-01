cd c:\ws\sboot\lab057
mvn clean package
java -jar .\target\hworld-docker-0.0.1-SNAPSHOT.jar
curl http://localhost:8081/ing1
docker ps > $null 2>&1; if ($?) { "Docker is running" } else { "Docker is not running" }
docker build -t ing1:latest .
docker images
docker run -p 8081:8081 ing1:latest
docker container list
curl http://localhost:8081/ing1
docker tag ing1:latest nerdysrisha/ing1:latest
docker push nerdysrisha/ing1:latest
kubectl delete -f deployment.yaml
kubectl config set-context --current --namespace=integrations
kubectl apply -f deployment.yaml
kubectl get all

kubectl port-forward svc/ing1-service -n integrations 8081:8081
kubectl get svc ing1-service -o wide
netstat -ano | findstr 8081
curl http://localhost:8081/ing1
