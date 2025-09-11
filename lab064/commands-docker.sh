#This project deals with Readiness and Liveliness of application at Kubernetes Level.
#These are Kubernetes-native features, not Spring Boot.
 #You configure them in your Deployment YAML (livenessProbe, readinessProbe).
 #Kubernetes will periodically call an endpoint (like /actuator/health in Spring Boot, or just / if it’s lightweight).
 #What they do
 #Readiness probe → tells Kubernetes “is this pod ready to accept traffic?”
 #If it fails, Kubernetes removes the pod from the Service so it doesn’t get requests.
 #Liveness probe → tells Kubernetes “is this pod still alive?”
 #If it fails, Kubernetes kills the pod and restarts it automatically.
 #Relation to Spring Boot
 #Spring Boot doesn’t restart itself if it hangs or crashes.
 #But Spring Boot does provide health endpoints (via spring-boot-starter-actuator) that you can point Kubernetes probes at.
 #Kubernetes then uses those endpoints to decide when to restart or stop routing traffic.
 #👉 So the probes are Kubernetes features, but Spring Boot can expose nice health endpoints for Kubernetes to check.
#Further, in pom.xml additiona dependency added and in application properties two props also added.

##SPRING BOOT HELLO WORLD - DOCKER - AKS START

cd C:\ws\sboot\lab064
mvn clean package
java -jar .\target\hworld-0.0.1-SNAPSHOT.jar
curl http://localhost:8080
curl http://localhost:8080/actuator/health/readiness
curl http://localhost:8080/actuator/health/liveness
curl http://localhost:8080/actuator/health

docker build -t hworld064:latest .
docker run -p 8080:8080 hworld064:latest

curl http://localhost:8080
curl http://localhost:8080/actuator/health/readiness
curl http://localhost:8080/actuator/health/liveness
curl http://localhost:8080/actuator/health

docker tag hworld064:latest nerdysrisha/hworld064:latest
docker push nerdysrisha/hworld064:latest
kubectl create namespace integrations
kubectl config set-context --current --namespace=integrations
kubectl delete -f .\deployment.yaml
kubectl apply -f deployment.yaml
kubectl get all
kubectl port-forward svc/hworld-service -n integrations 8080:8080

curl http://localhost:8080
curl http://localhost:8080/actuator/health/readiness
curl http://localhost:8080/actuator/health/liveness
curl http://localhost:8080/actuator/health
