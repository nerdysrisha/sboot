#IMPORTANT: FIRST RUN THE JOB DETAILS PROJECT. lab061. Because This one calls other so important the other one should be in running state.

cd c:\ws\sboot\lab060
mvn clean package
java -jar .\target\hworld-0.0.1-SNAPSHOT.jar
curl http://localhost:8081/customer/details

docker build -t customer:latest .

docker network create pod2pod-intg-network #If already exists say the same
docker run --name customer-service --network pod2pod-intg-network -p 8081:8081 -e JOB_SERVICE_URL=http://job-service:8082 customer:latest

#Before firing this ensure the JOB POD is also started and running.
curl http://localhost:8081/customer/details
docker tag customer:latest nerdysrisha/customer:latest
docker push nerdysrisha/customer:latest
kubectl create namespace integrations
kubectl delete -f deployment.yaml
kubectl config set-context --current --namespace=integrations
kubectl apply -f deployment.yaml
kubectl get all

kubectl port-forward svc/customer-service -n integrations 8081:8081
kubectl get svc customer-service -o wide
netstat -ano | findstr 8081
curl http://localhost:8081/customer/details


#Note: There are two projects Customer (this lab060) and Job (lab061).
# We want to test pod to pod communication, so Customer will be calling Job.
# Ensure Job is started first before Customer is being called.
#Once both are started, Customer Calls Job at 'POD-LEVEL'.
