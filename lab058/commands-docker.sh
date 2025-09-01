cd c:\ws\sboot\lab058
mvn clean package
java -jar .\target\hworld2-0.0.1-SNAPSHOT.jar
curl http://localhost:8082/ing2
docker ps > $null 2>&1; if ($?) { "Docker is running" } else { "Docker is not running" }
docker build -t ing2:latest .
docker images
docker run -p 8082:8082 ing2:latest
docker container list
curl http://localhost:8082/ing2
docker tag ing2:latest nerdysrisha/ing2:latest
docker push nerdysrisha/ing2:latest
kubectl delete -f deployment.yaml
kubectl config set-context --current --namespace=integrations
kubectl apply -f deployment.yaml
kubectl get all

kubectl port-forward svc/ing2-service -n integrations 8082:8082
kubectl get svc ing2-service -o wide
netstat -ano | findstr 8082
curl http://localhost:8082/ing2
