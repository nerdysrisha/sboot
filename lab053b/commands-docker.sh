##############SIMPLIFIED INFORMATION ###############
#THIS IS MOST BASIC DOCKER-DOCKERHUB-KIND IMPLEMENTATION
#USING SUPER LIGHT WEIGHT IMAGE- REFER DOCKER FILE 

#Straight build to kubernetes 
cd C:\ws\sboot\lab053a
mvn clean package
docker build -t hworld53a:latest .
docker tag hworld53a:latest nerdysrisha/hworld53a:latest
docker push nerdysrisha/hworld53a:latest
kubectl delete -f deployment.yaml
kubectl config set-context --current --namespace=integrations
kubectl apply -f deployment.yaml
kubectl wait --for=condition=Ready pod -l app=hworld -n integrations --timeout=300s
kubectl port-forward svc/hworld-service -n integrations 8080:8080
#Different terminal
curl http://localhost:8080



#Test at each stage 

cd C:\ws\sboot\lab053a
mvn clean package
java -jar .\target\hworld-0.0.1-SNAPSHOT.jar
curl http://localhost:8080
docker build -t hworld53a:latest .
docker run -p 8080:8080 hworld53a:latest
curl http://localhost:8080
docker tag hworld53a:latest nerdysrisha/hworld53a:latest
docker push nerdysrisha/hworld53a:latest
kubectl delete -f deployment.yaml
kubectl config set-context --current --namespace=integrations
kubectl apply -f deployment.yaml
kubectl wait --for=condition=Ready pod -l app=hworld -n integrations --timeout=300s
kubectl port-forward svc/hworld-service -n integrations 8080:8080
curl http://localhost:8080


 