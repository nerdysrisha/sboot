cd c:\ws\sboot\lab061
mvn clean package
java -jar .\target\hworld-0.0.1-SNAPSHOT.jar
curl http://localhost:8082/job/details

docker build -t job:latest .
docker images
docker network create pod2pod-intg-network #If already exists say the same

docker run --name job-service --network pod2pod-intg-network -p 8082:8082 job:latest

docker container list
curl http://localhost:8082/job/details


docker tag job:latest nerdysrisha/job:latest
docker push nerdysrisha/job:latest
kubectl create namespace integrations
kubectl delete -f deployment.yaml
kubectl config set-context --current --namespace=integrations
kubectl apply -f deployment.yaml
kubectl get all

kubectl port-forward svc/job-service -n integrations 8082:8082
kubectl get svc job-service -o wide
netstat -ano | findstr 8081
curl http://localhost:8082/job/details


#Note: There are two projects Customer (this lab060) and Job (lab061).
# We want to test pod to pod communication, so Customer will be calling Job.
# Ensure Job is started first before Customer is being called.
#Once both are started, Customer Calls Job at 'POD-LEVEL'.
