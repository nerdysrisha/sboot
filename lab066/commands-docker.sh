## Horizontal Pod Autoscaler (HPA) in Kubernetes
## The Horizontal Pod Autoscaler automatically scales the number of pods in a Deployment based on CPU or memory usage.
## To use it, first deploy your application with proper resource requests and limits defined.
## Then, create an HPA object that targets the Deployment and sets rules for scaling.
## When metrics cross the configured thresholds, Kubernetes increases or decreases the replica count automatically.
## This allows applications to handle varying workloads efficiently without manual intervention.
## In our case, we created a Deployment called **hpaenabledhw-deployment** running the container **hpaenabledhw**.
## We then defined an HPA named **hpaenabledhw-hpa** that targets this Deployment.
## The HPA is configured with minReplicas=1, maxReplicas=5, and average CPU utilization at 50%.
## This means:
## - If average CPU usage across pods of hpaenabledhw-deployment is above 50%, new pods will be added (up to 5 total).
## - If average CPU usage drops below 50%, pods will be scaled down (but never below 1).
## You can monitor scaling activity with: `kubectl get hpa -n integrations`
## And you can watch the actual number of pods increase or decrease with: `kubectl get pods -n integrations -w`

##SPRING BOOT HELLO WORLD - DOCKER - AKS START

#Pre-requisite
#Ensure Metrics Server is up and running 




cd C:\ws\sboot\lab066
mvn clean package
java -jar .\target\hpaenabledhw-0.0.1-SNAPSHOT.jar
curl http://localhost:8080
docker build -t hpaenabledhw66:latest .
docker run -p 8080:8080 hpaenabledhw66:latest
curl http://localhost:8080
docker tag hpaenabledhw66:latest nerdysrisha/hpaenabledhw66:latest
docker push nerdysrisha/hpaenabledhw66:latest
kubectl create namespace integrations
kubectl config set-context --current --namespace=integrations
kubectl delete -f .\deployment.yaml
kubectl apply -f deployment.yaml
kubectl get all
kubectl get hpa -n integrations
kubectl port-forward service/hpaenabledhw-service -n integrations 8080:8080
curl http://localhost:8080   
kubectl top nodes
kubectl top pods






####IF YOU WANT TO RUN STRAIGHT USE BELOW. OPEN NEW TERMINAL AND FIRE CURL 

clear
cd C:\ws\sboot\lab066
mvn clean package
docker build -t hpaenabledhw66:latest .
docker tag hpaenabledhw66:latest nerdysrisha/hpaenabledhw66:latest
docker push nerdysrisha/hpaenabledhw66:latest
kubectl create namespace integrations
kubectl config set-context --current --namespace=integrations
kubectl delete -f .\deployment.yaml
kubectl apply -f deployment.yaml
kubectl wait --for=condition=Ready pod -l app=hpaenabledhw -n integrations --timeout=300s
kubectl port-forward svc/hpaenabledhw-service -n integrations 8080:8080


#open new terminal and fire curl 



#inject load

kubectl run -it load-generator --rm --image=busybox -- /bin/sh
		while true; do wget -q -O- http://hpaenabledhw-service:8080/; sleep 2; done   #For every 2 second fire one req
		wget -q -O- http://hpaenabledhw-service:8080/    #Fire at will 
		for i in {1..20}; do wget -q -O- http://hpaenabledhw-service:8080/; done   #Fire 20 seconds and stop NOT WORKING DOUBLE CHECK 

#Control C to stop when we wish

#another terminal 
kubectl get hpa -n integrations -w
#another terminal 
kubectl get pods -n integrations -w