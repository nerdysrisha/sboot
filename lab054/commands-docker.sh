

##SPRING BOOT HELLO WORLD - DOCKER - AKS START


#Navigate to pom.xml directory. Eg. as below.

		cd C:\ws\sboot\lab054


#build the project

			mvn clean package

#Run the jar locally and test

		java -jar .\target\hworld-docker-0.0.1-SNAPSHOT.jar

#run the curl

		curl http://localhost:8080

#STOP the java app before proceeding to next step

#Check Docker is running or not

		docker ps > $null 2>&1; if ($?) { "Docker is running" } else { "Docker is not running" }

#Build, run, list the docker image

		docker build -t hworld:latest .


		PS C:\ws\sboot\lab054> docker build -t hworld:latest .
		[+] Building 6.1s (9/9) FINISHED                                                                                                                            docker:desktop-linux
		 => [internal] load build definition from Dockerfile                                                                                                                        0.0s
		 => => transferring dockerfile: 242B                                                                                                                                        0.0s
		 => [internal] load metadata for docker.io/library/amazoncorretto:22                                                                                                        2.6s
		 => [auth] library/amazoncorretto:pull token for registry-1.docker.io                                                                                                       0.0s
		 => [internal] load .dockerignore                                                                                                                                           0.0s
		 => => transferring context: 2B                                                                                                                                             0.0s
		 => [1/3] FROM docker.io/library/amazoncorretto:22@sha256:2b8b5ddee9d1f991b3b9f848e3d400f8f8953df6d2c5e848b3d899f5345d327f                                                  0.1s
		 => => resolve docker.io/library/amazoncorretto:22@sha256:2b8b5ddee9d1f991b3b9f848e3d400f8f8953df6d2c5e848b3d899f5345d327f                                                  0.1s
		 => [internal] load build context                                                                                                                                           1.0s
		 => => transferring context: 20.04MB                                                                                                                                        1.0s
		 => CACHED [2/3] WORKDIR /app                                                                                                                                               0.0s
		 => [3/3] COPY target/hworld-0.0.1-SNAPSHOT.jar /app/hworld-0.0.1-SNAPSHOT.jar                                                                                              0.2s
		 => exporting to image                                                                                                                                                      1.8s
		 => => exporting layers                                                                                                                                                     1.3s
		 => => exporting manifest sha256:a00943f9de8efc17993852aad9354394d1315c0f0cb3f3500080a200b545e894                                                                           0.0s
		 => => exporting config sha256:6b1068ab29cd645fae58fd318613603c1b3fbd7b77d28542b0a41ed03131b19d                                                                             0.0s
		 => => exporting attestation manifest sha256:e4fc4dd9d0320a965c2fd7e0c05046e494657fcae6ffd8ed1db77a8ff8e015bc                                                               0.1s
		 => => exporting manifest list sha256:68bed9888e78d2e59b34edc5c69fe187d9926a5c81a35c522eacce6dcdb29366                                                                      0.0s
		 => => naming to docker.io/library/hworld:latest                                                                                                                            0.0s
		 => => unpacking to docker.io/library/hworld:latest

#Check if image is created and hosted on docker local

		docker images


		PS C:\ws\sboot\lab054> docker images
		REPOSITORY                                      TAG                                                                           IMAGE ID       CREATED              SIZE
		hworld                                          latest                                                                        68bed9888e78   About a minute ago   758MB
		curlimages/curl                                 latest                                                                        4026b29997dc   5 weeks ago          9.85MB
		docker/desktop-kubernetes                       kubernetes-v1.31.4-cni-v1.6.0-critools-v1.31.1-cri-dockerd-v0.3.15-1-debian   1405239673ef   8 months ago         577MB
		registry.k8s.io/kube-apiserver                  v1.31.4                                                                       ace6a943b058   8 months ago         125MB
		registry.k8s.io/kube-controller-manager         v1.31.4                                                                       4bd1d4a449e7   8 months ago         118MB



#Run the docker image locally

		docker run -p 8080:8080 hworld:latest


		PS C:\ws\sboot\lab054> docker run -p 8080:8080 hworld:latest



		2025-08-26T16:43:40.595Z  INFO 1 --- [bringlabs] [           main] com.bring.lab.Lab1Application            : Starting Lab1Application v0.0.1-SNAPSHOT using Java 22.0.2 with PID 1 (/app/hworld-0.0.1-SNAPSHOT.jar started by root in /app)
		2025-08-26T16:43:40.613Z  INFO 1 --- [bringlabs] [           main] com.bring.lab.Lab1Application            : No active profile set, falling back to 1 default profile: "default"
		2025-08-26T16:43:42.137Z  INFO 1 --- [bringlabs] [           main] o.s.b.w.embedded.tomcat.TomcatWebServer  : Tomcat initialized with port 8080 (http)
		2025-08-26T16:43:42.172Z  INFO 1 --- [bringlabs] [           main] o.apache.catalina.core.StandardService   : Starting service [Tomcat]
		2025-08-26T16:43:42.172Z  INFO 1 --- [bringlabs] [           main] o.apache.catalina.core.StandardEngine    : Starting Servlet engine: [Apache Tomcat/10.1.30]
		2025-08-26T16:43:42.234Z  INFO 1 --- [bringlabs] [           main] o.a.c.c.C.[Tomcat].[localhost].[/]       : Initializing Spring embedded WebApplicationContext
		2025-08-26T16:43:42.235Z  INFO 1 --- [bringlabs] [           main] w.s.c.ServletWebServerApplicationContext : Root WebApplicationContext: initialization completed in 1525 ms
		2025-08-26T16:43:42.734Z  INFO 1 --- [bringlabs] [           main] o.s.b.w.embedded.tomcat.TomcatWebServer  : Tomcat started on port 8080 (http) with context path '/'
		2025-08-26T16:43:42.787Z  INFO 1 --- [bringlabs] [           main] com.bring.lab.Lab1Application            : Started Lab1Application in 2.899 seconds (process running for 4.084)





#in another terminal
			docker container list

#Run the curl
		 curl http://localhost:8080

		PS C:\Users\Sridhara> docker container list
		CONTAINER ID   IMAGE           COMMAND                  CREATED              STATUS              PORTS                    NAMES
		6e7d354a6bc4   hworld:latest   "java -jar hworld-0.…"   About a minute ago   Up About a minute   0.0.0.0:8080->8080/tcp   exciting_buck
		PS C:\Users\Sridhara>





#Docker Tag the image

	PS C:\Users\Sridhara> docker tag hworld:latest nerdysrisha/hworld:latest
	PS C:\Users\Sridhara>



#Docker push the image to public Docker Hub

  docker push nerdysrisha/hworld:latest


	PS C:\Users\Sridhara> docker push nerdysrisha/hworld:latest
	The push refers to repository [docker.io/nerdysrisha/hworld]
	da47af2143e3: Pushed
	c90aac9416f1: Pushed
	5acaf245b957: Mounted from sridharavshastry/hworld
	5fe405ca6282: Mounted from sridharavshastry/hworld
	31945a6db082: Mounted from sridharavshastry/hworld
	latest: digest: sha256:68bed9888e78d2e59b34edc5c69fe187d9926a5c81a35c522eacce6dcdb29366 size: 856
	PS C:\Users\Sridhara>



#Apply deployment.yaml to local k8


  kubectl delete -f deployment.yaml

	PS C:\ws\sboot\lab053> kubectl delete -f deployment.yaml
	Error from server (NotFound): error when deleting "deployment.yaml": deployments.apps "hworld-deployment" not found
	Error from server (NotFound): error when deleting "deployment.yaml": services "hworld-service" not found
	PS C:\ws\sboot\lab053>

#Get all and view if any are there after switching to Integrations namespaces(as an example)

	PS C:\ws\sboot\lab053> kubectl config set-context --current --namespace=integrations
	Context "docker-desktop" modified.
	PS C:\ws\sboot\lab053>
	PS C:\ws\sboot\lab053> kubectl get all
	No resources found in integrations namespace.
	PS C:\ws\sboot\lab053>
	PS C:\ws\sboot\lab053>

#Check the deployment configuration

	PS C:\ws\sboot\lab053> type deployment.yaml
	apiVersion: apps/v1
	kind: Deployment
	metadata:
	  name: hworld-deployment
	  namespace: integrations
	spec:
	  replicas: 1
	  selector:
		matchLabels:
		  app: hworld
	  template:
		metadata:
		  labels:
			app: hworld
		spec:
		  containers:
			- name: hworld
			  image: nerdysrisha/hworld:latest
			  imagePullPolicy: Always
			  ports:
				- containerPort: 8080
	---
	apiVersion: v1
	kind: Service
	metadata:
	  name: hworld-service
	  namespace: integrations
	spec:
	  type: NodePort
	  selector:
		app: hworld
	  ports:
		- protocol: TCP
		  port: 8080
		  targetPort: 8080
		  nodePort: 30080
	PS C:\ws\sboot\lab053>




#Deploy the project to local kubernetes.

  kubectl apply -f deployment.yaml

	PS C:\ws\sboot\lab053> kubectl apply -f deployment.yaml
	deployment.apps/hworld-deployment created
	service/hworld-service created
	PS C:\ws\sboot\lab053>


#Get all resources


	PS C:\ws\sboot\lab053> kubectl get all
	NAME                                     READY   STATUS    RESTARTS   AGE
	pod/hworld-deployment-5f87899556-vzj74   1/1     Running   0          20s

	NAME                     TYPE       CLUSTER-IP      EXTERNAL-IP   PORT(S)          AGE
	service/hworld-service   NodePort   10.96.160.120   <none>        8080:30080/TCP   20s

	NAME                                READY   UP-TO-DATE   AVAILABLE   AGE
	deployment.apps/hworld-deployment   1/1     1            1           20s

	NAME                                           DESIRED   CURRENT   READY   AGE
	replicaset.apps/hworld-deployment-5f87899556   1         1         1       20s
	PS C:\ws\sboot\lab053>

#Access the service, which will result in failure

	PS C:\ws\sboot\lab053> curl http://localhost:30080
	curl : Unable to connect to the remote server
	At line:1 char:1
	+ curl http://localhost:30080
	+ ~~~~~~~~~~~~~~~~~~~~~~~~~~~
		+ CategoryInfo          : InvalidOperation: (System.Net.HttpWebRequest:HttpWebRequest) [Invoke-WebRequest], WebException
		+ FullyQualifiedErrorId : WebCmdletWebResponseException,Microsoft.PowerShell.Commands.InvokeWebRequestCommand

	PS C:\ws\sboot\lab053>


#Check if there are any existing portforwarding happenning. This will give nothing, when nothing is configured.
#Using bash terminal


	$ netstat -ano | findstr 8080

	Sridhara@LAPTOP-2JR5V2SV MINGW64 ~
	$




#Forward the port

  PS C:\ws\sboot\lab053> kubectl port-forward svc/hworld-service -n integrations 8080:8080
  Forwarding from 127.0.0.1:8080 -> 8080
  Forwarding from [::1]:8080 -> 8080
  Handling connection for 8080


#Open a new termainal and check for port forwarding information. The service WILL NOT GIVE ANYTHING.

	PS C:\Users\Sridhara> kubectl get svc hworld-service -o wide
	NAME             TYPE       CLUSTER-IP      EXTERNAL-IP   PORT(S)          AGE     SELECTOR
	hworld-service   NodePort   10.96.160.120   <none>        8080:30080/TCP   4m51s   app=hworld
	PS C:\Users\Sridhara>


# CHECK THE NETSTAT INFO. this is Bash terminal


	$ netstat -ano | findstr 8080
	  TCP    127.0.0.1:8080         0.0.0.0:0              LISTENING       10880
	  TCP    [::1]:8080             [::]:0                 LISTENING       10880
	  TCP    [::1]:8080             [::1]:53413            TIME_WAIT       0




#Open a new termainal and run the curl

  curl http://localhost:8080


