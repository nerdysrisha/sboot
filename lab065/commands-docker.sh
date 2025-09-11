
##Taints and Tolerations in Kubernetes
##Taints and tolerations are used to control which workloads can or cannot run on specific worker nodes.
##To use them, first taint a node and then add a matching toleration in the pod’s Deployment YAML.
##When scheduling, Kubernetes checks these rules to decide where to place each pod.
##A taint effectively says: “keep out unless you have permission”, and a toleration is the “pass” that allows a pod to land on that node.
##Suppose intg-ks-worker is a node with extra CPU and memory, dedicated to heavy analytics workloads.
##We taint the node like this: app-key=analytics:NoSchedule
##Workloads gets scheduled on this node only when there is a 'toleration' mentioned that matches the taint key.

##SPRING BOOT HELLO WORLD - DOCKER - AKS START

cd C:\ws\sboot\lab065
mvn clean package
java -jar .\target\analytics-0.0.1-SNAPSHOT.jar

curl http://localhost:8080

docker build -t analytics065:latest .
docker run -p 8080:8080 analytics065:latest

curl http://localhost:8080

kubectl taint nodes intg-ks-worker app-key-
kubectl describe node intg-ks-worker | grep Taints
kubectl taint nodes intg-ks-worker app-key=analytics:NoSchedule



docker tag analytics065:latest nerdysrisha/analytics065:latest
docker push nerdysrisha/analytics065:latest
kubectl create namespace integrations
kubectl config set-context --current --namespace=integrations
kubectl delete -f .\deployment.yaml
kubectl apply -f deployment.yaml
kubectl get all
kubectl port-forward svc/analytics-service -n integrations 8080:8080

