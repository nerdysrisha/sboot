cd c:\ws\sboot\lab059
mvn clean package
java -jar .\target\hworld-0.0.1-SNAPSHOT.jar
curl http://localhost:8083/egress/intg1
docker ps > $null 2>&1; if ($?) { "Docker is running" } else { "Docker is not running" }
docker build -t egress-intg1:latest .
docker images
docker run -p 8083:8083 egress-intg1:latest
docker container list
curl http://localhost:8083/egress/intg1
docker tag egress-intg1:latest nerdysrisha/egress-intg1:latest
docker push nerdysrisha/egress-intg1:latest
kubectl create namespace integrations
kubectl delete -f deployment.yaml
kubectl config set-context --current --namespace=integrations
kubectl apply -f deployment.yaml
kubectl get all

kubectl port-forward svc/egress-intg1-service -n integrations 8083:8083
kubectl get svc egress-intg1-service -o wide
netstat -ano | findstr 8083
curl http://localhost:8083/egress/intg1