##############SIMPLIFIED INFORMATION ###############
#THIS IS MOST BASIC DOCKER-DOCKERHUB-KIND IMPLEMENTATION
#USING SUPER LIGHT WEIGHT IMAGE- REFER DOCKER FILE
#IMPORTANT NOTE:
#This lab is simple project with all hardcoded values to demonstrate memory dump of sensitive information
#This lab when used in conjunction with memory dump techniquest, makes more sense as it is just to demo.
#For simple springboot project upto docker use lab053a



#Straight build to kubernetes
# Navigate to project
cd C:\ws\sboot\lab053b
# 5-second warning before deleting the namespace
Write-Host "WARNING: About to delete the 'integrations' namespace. You have 5 seconds to cancel (Ctrl+C)..."
Start-Sleep -Seconds 5
# Delete and recreate namespace
kubectl delete ns integrations --ignore-not-found		##### IMPORTANT IMPORTANT IMPORTANT LINE
kubectl create ns integrations
# Set context to the new namespace
kubectl config set-context --current --namespace=integrations
# Build and push Docker image
mvn clean package
docker build -t payments53b:latest .
docker tag payments53b:latest nerdysrisha/payments53b:latest
docker push nerdysrisha/payments53b:latest
# Deploy the application
kubectl delete -f deployment.yaml --ignore-not-found
kubectl apply -f deployment.yaml
# Wait for the pod to be ready (dynamic pod name)
$POD_NAME = kubectl get pods -n integrations -l app=payments53b -o jsonpath="{.items[0].metadata.name}"
kubectl wait --for=condition=Ready pod/$POD_NAME -n integrations --timeout=300s
# Port-forward service
kubectl port-forward svc/payments53b-service -n integrations 8080:8080



#Test at each stage

cd C:\ws\sboot\lab053b
mvn clean package
java -jar .\target\payments-0.0.1-SNAPSHOT.jar
#Curl with post command
docker build -t payments53b:latest .
docker run -p 8080:8080 payments53b:latest
#Curl with post command
docker tag payments53b:latest nerdysrisha/payments53b:latest
docker push nerdysrisha/payments53b:latest
kubectl delete -f deployment.yaml
kubectl config set-context --current --namespace=integrations
kubectl apply -f deployment.yaml
kubectl wait --for=condition=Ready pod -l app=payments53b -n integrations --timeout=300s
kubectl port-forward svc/payments53b-service -n integrations 8080:8080
#Curl with post command



 curl -X POST http://localhost:8080/payment/process   -H "Content-Type: application/json"   -H "Authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.fake.payload"   -H "X-Message-Id: MSG-12345"   -d '{
    "accountNumber": "123456789",
    "creditCardNumber": "4111111111111111",
    "expiryDate": "12/28",
    "cvv": "123",
    "amount": 500.00,
    "destinationAccount": "987654321",
    "senderName": "John Doe",
    "receiverName": "Jane Smith"
  }'
