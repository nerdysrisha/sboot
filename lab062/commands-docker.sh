

##SPRING BOOT HELLO WORLD - DOCKER - AKS START

		cd C:\ws\sboot\lab062
		mvn clean package
    java -jar .\target\hworld-0.0.1-SNAPSHOT.jar
		curl http://localhost:8080
		docker build -t hworld062:latest .
		docker run -p 8080:8080 hworld062:latest

#If we want to pass additional environment variables, we can use below.
#Note that we are passing environment variables explicitely as docker does not have any native feature to pass additional variables, unlike Kubernetes ConfigMap
#Typical Spring boot has application.properties, which gets loaded into Environment and can be retrieved by Java Configuration annotation dynamically.

   # docker run -p 8080:8080 -e hostname=myapp.example.com -e port=8080 hworld056:latest

#in another terminal
	docker container list
  curl http://localhost:8080
  docker tag hworld062:latest nerdysrisha/hworld062:latest
  docker push nerdysrisha/hworld062:latest

#Check / Know current namespace   or To view the current namespace execute below command, so that wrongly we do not put our deployments.

  kubectl config view --minify --output 'jsonpath={..namespace}'

#Delete Secret / deployment.yaml if exists.
  kubectl delete secret hworld-secret
  kubectl delete -f deployment.yaml
  kubectl create namespace integrations

#Get all and view if any are there after switching to Integrations namespaces(as an example)
  kubectl config set-context --current --namespace=integrations
  kubectl get all

  kubectl apply -f secret-config.yaml
  kubectl apply -f deployment.yaml

#Get all resources
    kubectl get all





#Forward the port

kubectl port-forward svc/hworld-service -n integrations 8080:8080

    $ kubectl port-forward svc/hworld-service -n integrations 8080:8080
    Forwarding from 127.0.0.1:8080 -> 8080
    Forwarding from [::1]:8080 -> 8080




#Open a new terminal and run the curl

  curl http://localhost:8080


#check all the environment variables of a pod
#Get all resources or pod only.


PS C:\ws>  kubectl exec -it hworld-deployment-ddc6479fd-frd8g -- env
    PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
    HOSTNAME=hworld-deployment-ddc6479fd-frd8g
    LANG=C.UTF-8
    JAVA_HOME=/usr/lib/jvm/java-22-amazon-corretto
    dbport=8080
    dbhostname=db.example.com
    JOB_SERVICE_SERVICE_HOST=10.96.117.215
    JOB_SERVICE_PORT_8082_TCP_PROTO=tcp
    HWORLD_SERVICE_PORT_8080_TCP_ADDR=10.96.148.68



#MODIF THE SECRET VALUE here here her hreere

#Edit the secret configuration and then apply


  kubectl apply -f secret-config.yaml


PS C:\ws\sboot\lab062>   kubectl apply -f secret-config.yaml
secret/hworld-secret configured
PS C:\ws\sboot\lab062> kubectl rollout restart deployment hworld-deployment
deployment.apps/hworld-deployment restarted
PS C:\ws\sboot\lab062> kubectl get pods
NAME                                       READY   STATUS            RESTARTS       AGE
customer-deployment-6679f6d54b-4xjx5       2/2     Running           4 (157m ago)   35h
egress-intg1-deployment-687f6fbc6f-mggch   2/2     Running           4 (157m ago)   38h
hworld-deployment-56df76cf9b-x7rth         1/2     PodInitializing   0              4s
hworld-deployment-ddc6479fd-frd8g          2/2     Running           0              6m6s
ing1-deployment-bb6c6bb5f-k85rj            2/2     Running           4 (157m ago)   38h
ing2-deployment-6bc9968897-mvp9z           2/2     Running           4 (157m ago)   38h
job-deployment-58774b4cb8-rx4zl            2/2     Running           4 (157m ago)   35h
PS C:\ws\sboot\lab062> kubectl get pods
NAME                                       READY   STATUS            RESTARTS       AGE
customer-deployment-6679f6d54b-4xjx5       2/2     Running           4 (157m ago)   35h
egress-intg1-deployment-687f6fbc6f-mggch   2/2     Running           4 (157m ago)   38h
hworld-deployment-56df76cf9b-x7rth         1/2     PodInitializing   0              12s
hworld-deployment-ddc6479fd-frd8g          2/2     Running           0              6m14s
ing1-deployment-bb6c6bb5f-k85rj            2/2     Running           4 (157m ago)   38h
ing2-deployment-6bc9968897-mvp9z           2/2     Running           4 (157m ago)   38h
job-deployment-58774b4cb8-rx4zl            2/2     Running           4 (157m ago)   35h
PS C:\ws\sboot\lab062> kubectl get pods
NAME                                       READY   STATUS    RESTARTS       AGE
customer-deployment-6679f6d54b-4xjx5       2/2     Running   4 (165m ago)   35h
egress-intg1-deployment-687f6fbc6f-mggch   2/2     Running   4 (165m ago)   38h
hworld-deployment-56df76cf9b-x7rth         2/2     Running   0              8m18s
ing1-deployment-bb6c6bb5f-k85rj            2/2     Running   4 (165m ago)   38h
ing2-deployment-6bc9968897-mvp9z           2/2     Running   4 (165m ago)   38h
job-deployment-58774b4cb8-rx4zl            2/2     Running   4 (165m ago)   36h
PS C:\ws\sboot\lab062>


#Restart the port forwarding as the previous one gets disconnected.

Forwarding from 127.0.0.1:8080 -> 8080
Forwarding from [::1]:8080 -> 8080
Handling connection for 8080
Handling connection for 8080
E0908 07:26:14.215713   20876 portforward.go:413] "Unhandled Error" err="an error occurred forwarding 8080 -> 8080: error forwarding port 8080 to pod 45a5265706a31db74137aeddb20cbb9d136dd61f9eb482c512dc9d0b5fedbb84, uid : failed to find sandbox \"45a5265706a31db74137aeddb20cbb9d136dd61f9eb482c512dc9d0b5fedbb84\" in store: not found"
error: lost connection to pod


PS C:\ws\sboot\lab062> kubectl port-forward svc/hworld-service -n integrations 8080:8080
Forwarding from 127.0.0.1:8080 -> 8080
Forwarding from [::1]:8080 -> 8080
Handling connection for 8080






PS C:\ws\sboot\lab062> curl http://localhost:8080

#NOTICE THE NEW VALUES IN THE LOGS THAT WE CHANGED. 


StatusCode        : 200
StatusDescription :
Content           : Hello World. DB Host and Port are db.pista.com:9000
RawContent        : HTTP/1.1 200
                    Keep-Alive: timeout=60
                    Connection: keep-alive
                    Content-Length: 51
                    Content-Type: text/plain;charset=UTF-8
                    Date: Mon, 08 Sep 2025 06:26:27 GMT

                    Hello World. DB Host and Port are db.p...
Forms             : {}
Headers           : {[Keep-Alive, timeout=60], [Connection, keep-al



#As an example changed port number from 8080 to 8081. Notice the same below .

    $ kubectl exec -it hworld-deployment-5b897784cc-vxttk -- env
    PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
    HOSTNAME=hworld-deployment-5b897784cc-vxttk
    LANG=C.UTF-8
    JAVA_HOME=/usr/lib/jvm/java-22-amazon-corretto
    dbhostname=db.example.com
    dbport=8081
    HWORLD_SERVICE_SERVICE_HOST=10.96.237.137
    HWORLD_SERVICE_PORT_8080_TCP=tcp://10.96.237.137:8080
    HWORLD_SERVICE_PORT_8080_TCP_ADDR=10.96.237.137
    KUBERNETES_PORT_443_TCP_PROTO=tcp
    KUBERNETES_PORT_443_TCP_PORT=443
