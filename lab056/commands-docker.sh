

##SPRING BOOT HELLO WORLD - DOCKER - AKS START


#Navigate to pom.xml directory. Eg. as below.

		cd C:\ws\sboot\lab056


#build the project

			mvn clean package

#Run the jar locally and test

     java -jar .\target\hworld-0.0.1-SNAPSHOT.jar

#run the curl in different termainal

		curl http://localhost:8080

#STOP the java app before proceeding to next step

#Check Docker is running or not

		docker ps > $null 2>&1; if ($?) { "Docker is running" } else { "Docker is not running" }

#Build, run, list the docker image. here as an example, added the project number

		docker build -t hworld056:latest .




#Check if image is created and hosted on docker local

		docker images


#Run the docker image locally. Any values inside the properties file will be loaded into environment automatically.
#For additional properties if we want to inject, use the next command.

   docker run -p 8080:8080 hworld056:latest




#If we want to pass additional environment variables, we can use below.
#Note that we are passing environment variables explicitely as docker does not have any native feature to pass additional variables, unlike Kubernetes ConfigMap
#Typical Spring boot has application.properties, which gets loaded into Environment and can be retrieved by Java Configuration annotation dynamically.

   # docker run -p 8080:8080 -e hostname=myapp.example.com -e port=8080 hworld056:latest



#in another terminal
			docker container list





#Run the curl
		 curl http://localhost:8080





#Docker Tag the image and push


docker tag hworld056:latest nerdysrisha/hworld056:latest
docker push nerdysrisha/hworld056:latest





#Check current namespace

  kubectl config view --minify --output 'jsonpath={..namespace}'


#Apply deployment.yaml to local k8


  kubectl delete -f deployment.yaml

  #gets deleted if objects exists

#Create namespace 'integrations', if it is not available.

    PS C:\ws\sboot\lab056> kubectl create namespace integrations
    namespace/integrations created
    PS C:\ws\sboot\lab056>



#Get all and view if any are there after switching to Integrations namespaces(as an example)

    PS C:\ws\sboot\lab056> kubectl config set-context --current --namespace=integrations
    Context "docker-desktop" modified.
    PS C:\ws\sboot\lab056>




    PS C:\ws\sboot\lab056> kubectl get all
    No resources found in integrations namespace.
    PS C:\ws\sboot\lab056>






#Check the deployment configuration

    type deployment.yaml

      PS C:\ws\sboot\lab056> type deployment.yaml



#Deploy the project to local kubernetes.

  kubectl apply -f deployment.yaml

    PS C:\ws\sboot\lab056>   kubectl apply -f deployment.yaml
    configmap/hworld-config created
    deployment.apps/hworld-deployment created
    service/hworld-service created
    PS C:\ws\sboot\lab056>



#Get all resources

    kubectl get all

        PS C:\ws\sboot\lab056> kubectl get all
        NAME                                     READY   STATUS    RESTARTS   AGE
        pod/hworld-deployment-8467c84578-rpdns   1/1     Running   0          19s

        NAME                     TYPE       CLUSTER-IP     EXTERNAL-IP   PORT(S)          AGE
        service/hworld-service   NodePort   10.96.191.76   <none>        8080:30080/TCP   19s

        NAME                                READY   UP-TO-DATE   AVAILABLE   AGE
        deployment.apps/hworld-deployment   1/1     1            1           19s

        NAME                                           DESIRED   CURRENT   READY   AGE
        replicaset.apps/hworld-deployment-8467c84578   1         1         1       19s
        PS C:\ws\sboot\lab056>








#Access the service, which will result in failure

  curl http://localhost:30080

  #WILL FAIL


#Check if there are any existing portforwarding happenning. This will give nothing, when nothing is configured.
#Using bash terminal


	$ netstat -ano | findstr 8080

	Sridhara@LAPTOP-2JR5V2SV MINGW64 ~
	$




#Forward the port

kubectl port-forward svc/hworld-service -n integrations 8080:8080

    $ kubectl port-forward svc/hworld-service -n integrations 8080:8080
    Forwarding from 127.0.0.1:8080 -> 8080
    Forwarding from [::1]:8080 -> 8080




#Open a new termainal and run the curl

  curl http://localhost:8080


#check all the environment variables of a pod
#Get all resources or pod only.


          PS C:\ws\sboot\lab056>     kubectl get all
          NAME                                     READY   STATUS    RESTARTS   AGE
          pod/hworld-deployment-8467c84578-mmxhs   1/1     Running   0          5s

          NAME                     TYPE       CLUSTER-IP      EXTERNAL-IP   PORT(S)          AGE
          service/hworld-service   NodePort   10.96.237.137   <none>        8080:30080/TCP   5s

          NAME                                READY   UP-TO-DATE   AVAILABLE   AGE
          deployment.apps/hworld-deployment   1/1     1            1           5s

          NAME                                           DESIRED   CURRENT   READY   AGE
          replicaset.apps/hworld-deployment-8467c84578   1         1         1       5s

kubectl exec -it hworld-deployment-8467c84578-mmxhs -- env


      $ kubectl exec -it hworld-deployment-8467c84578-mmxhs -- env

        PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
        HOSTNAME=hworld-deployment-8467c84578-mmxhs
        LANG=C.UTF-8
        JAVA_HOME=/usr/lib/jvm/java-22-amazon-corretto
        dbhostname=db.example.com
        dbport=8080
        KUBERNETES_SERVICE_HOST=10.96.0.1
        KUBERNETES_PORT_443_TCP_PROTO=tcp
        KUBERNETES_PORT_443_TCP_ADDR=10.96.0.1
        HWORLD_SERVICE_PORT=tcp://10.96.237.137:8080
        HWORLD_SERVICE_PORT_8080_TCP=tcp://10.96.237.137:

#Notice the variables are listed above viz., dbhostname and dbport, which have been loaded into environment.

#Advantage of Config Maps is like if we want to change at runtime, we can use below option

$ kubectl edit configmap hworld-config -n integrations

#once the values are changed we run below command

$ kubectl rollout restart deployment hworld-deployment

#Once this is done, any new values changed gets into the environment.

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
