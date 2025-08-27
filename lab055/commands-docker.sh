

##SPRING BOOT HELLO WORLD - DOCKER - AKS START


#Navigate to pom.xml directory. Eg. as below.

		cd C:\ws\sboot\lab055


#build the project

			mvn clean package

#Run the jar locally and test

     java -jar .\target\hworld-0.0.1-SNAPSHOT.jar

#run the curl

		curl http://localhost:8080

#STOP the java app before proceeding to next step

#Check Docker is running or not

		docker ps > $null 2>&1; if ($?) { "Docker is running" } else { "Docker is not running" }

#Build, run, list the docker image. here as an example, added the project number

		docker build -t hworld055:latest .

      PS C:\ws\sboot\lab055> docker build -t hworld055:latest .
      [+] Building 6.3s (10/10) FINISHED                                                                                                                                                                                                            docker:desktop-linux
       => [internal] load build definition from Dockerfile                                                                                                                                                                                                          0.0s
       => => transferring dockerfile: 608B                                                                                                                                                                                                                          0.0s
       => [internal] load metadata for docker.io/library/amazoncorretto:22                                                                                                                                                                                          2.6s
       => [auth] library/amazoncorretto:pull token for registry-1.docker.io                                                                                                                                                                                         0.0s
       => [internal] load .dockerignore                                                                                                                                                                                                                             0.1s
       => => transferring context: 2B                                                                                                                                                                                                                               0.0s
       => [1/4] FROM docker.io/library/amazoncorretto:22@sha256:2b8b5ddee9d1f991b3b9f848e3d400f8f8953df6d2c5e848b3d899f5345d327f                                                                                                                                    0.0s
       => => resolve docker.io/library/amazoncorretto:22@sha256:2b8b5ddee9d1f991b3b9f848e3d400f8f8953df6d2c5e848b3d899f5345d327f                                                                                                                                    0.0s
       => [internal] load build context                                                                                                                                                                                                                             0.7s
       => => transferring context: 20.04MB                                                                                                                                                                                                                          0.7s
       => CACHED [2/4] WORKDIR /app                                                                                                                                                                                                                                 0.0s
       => [3/4] COPY target/hworld-0.0.1-SNAPSHOT.jar /app/hworld-0.0.1-SNAPSHOT.jar                                                                                                                                                                                0.2s
       => [4/4] RUN chown -R root:root /app && chmod 555 /app && chmod 444 /app/hworld-0.0.1-SNAPSHOT.jar                                                                                                                                                           0.6s
       => exporting to image                                                                                                                                                                                                                                        1.7s
       => => exporting layers                                                                                                                                                                                                                                       1.1s
       => => exporting manifest sha256:f101bc42a8b2294692b5a8c9a550b9cd87b7266140fb93afedf7e96585948aef                                                                                                                                                             0.0s
       => => exporting config sha256:cb8c418ca57e9ec73db522de3f6f2a6a60a7c6cbf28948668499f2003cfc1e6e                                                                                                                                                               0.0s
       => => exporting attestation manifest sha256:dcf89039a5bcae06eb811dfbc889ae19d84c8a1c6dae897d5da303653e3c073b                                                                                                                                                 0.1s
       => => exporting manifest list sha256:b9ceb04669078b2b3a853d06fd9080ec6d52d2f566619838754f89d8fdb47df1                                                                                                                                                        0.0s
       => => naming to docker.io/library/hworld055:latest                                                                                                                                                                                                           0.0s
       => => unpacking to docker.io/library/hworld055:latest                                                                                                                                                                                                        0.3s
      PS C:\ws\sboot\lab055>

#Check if image is created and hosted on docker local

		docker images

        PS C:\ws\sboot\lab055> docker images
        REPOSITORY                                      TAG                                                                           IMAGE ID       CREATED          SIZE
        hworld055                                       latest                                                                        b9ceb0466907   25 seconds ago   796MB
        curlimages/curl                                 latest                                                                        4026b29997dc   5 weeks ago      9.85MB
        docker/desktop-kubernetes                       kubernetes-v1.31.4-cni-v1.6.0-critools-v1.31.1-cri-dockerd-v0.3.15-1-debian   1405239673ef   8 months ago     577MB
        registry.k8s.io/kube-apiserver                  v1.31.4                                                                       ace6a943b058   8 months ago     125MB
        registry.k8s.io/kube-scheduler                  v1.31.4                                                                       1a3081cb7d21   8 months ago     90.8MB

#Run the docker image locally

		docker run -p 8080:8080 hworld055:latest




      2025-08-27T14:57:34.238Z  INFO 1 --- [bringlabs] [           main] com.bring.lab.Lab1Application            : Starting Lab1Application v0.0.1-SNAPSHOT using Java 22.0.2 with PID 1 (/app/hworld-0.0.1-SNAPSHOT.jar started by ? in /app)
      2025-08-27T14:57:34.241Z  INFO 1 --- [bringlabs] [           main] com.bring.lab.Lab1Application            : No active profile set, falling back to 1 default profile: "default"
      2025-08-27T14:57:35.480Z  INFO 1 --- [bringlabs] [           main] o.s.b.w.embedded.tomcat.TomcatWebServer  : Tomcat initialized with port 8080 (http)
      2025-08-27T14:57:35.503Z  INFO 1 --- [bringlabs] [           main] o.apache.catalina.core.StandardService   : Starting service [Tomcat]
      2025-08-27T14:57:35.503Z  INFO 1 --- [bringlabs] [           main] o.apache.catalina.core.StandardEngine    : Starting Servlet engine: [Apache Tomcat/10.1.30]
      2025-08-27T14:57:35.555Z  INFO 1 --- [bringlabs] [           main] o.a.c.c.C.[Tomcat].[localhost].[/]       : Initializing Spring embedded WebApplicationContext
      2025-08-27T14:57:35.557Z  INFO 1 --- [bringlabs] [           main] w.s.c.ServletWebServerApplicationContext : Root WebApplicationContext: initialization completed in 1240 ms
      2025-08-27T14:57:35.959Z  INFO 1 --- [bringlabs] [           main] o.s.b.w.embedded.tomcat.TomcatWebServer  : Tomcat started on port 8080 (http) with context path '/'
      2025-08-27T14:57:35.995Z  INFO 1 --- [bringlabs] [           main] com.bring.lab.Lab1Application            : Started Lab1Application in 2.456 seconds (process running for 3.335)


#in another terminal
			docker container list


    $ docker container list
    CONTAINER ID   IMAGE              COMMAND                  CREATED          STATUS          PORTS                    NAMES
    e135283e5bb5   hworld055:latest   "java -jar hworld-0.…"   33 seconds ago   Up 33 seconds   0.0.0.0:8080->8080/tcp   trusting_panini






#Run the curl
		 curl http://localhost:8080





#Docker Tag the image and push


docker tag hworld055:latest nerdysrisha/hworld055:latest
docker push nerdysrisha/hworld055:latest



      PS C:\ws\sboot\lab055> docker tag hworld055:latest nerdysrisha/hworld055:latest
      PS C:\ws\sboot\lab055> docker push nerdysrisha/hworld055:latest
      The push refers to repository [docker.io/nerdysrisha/hworld055]
      945f33c87cf2: Pushed
      ef71c2b84620: Pushed
      5fe405ca6282: Pushed
      0dcedd346d2a: Pushed
      5acaf245b957: Pushed
      31945a6db082: Pushed
      latest: digest: sha256:b9ceb04669078b2b3a853d06fd9080ec6d52d2f566619838754f89d8fdb47df1 size: 856
      PS C:\ws\sboot\lab055>
      PS C:\ws\sboot\lab055>




#Apply deployment.yaml to local k8


  kubectl delete -f deployment.yaml

	PS C:\ws\sboot\lab053> kubectl delete -f deployment.yaml
	Error from server (NotFound): error when deleting "deployment.yaml": deployments.apps "hworld-deployment" not found
	Error from server (NotFound): error when deleting "deployment.yaml": services "hworld-service" not found
	PS C:\ws\sboot\lab053>

	or, if they exist get deleted.


	PS C:\ws\sboot\lab055> kubectl delete -f deployment.yaml
  deployment.apps "hworld-deployment" deleted
  service "hworld-service" deleted
  PS C:\ws\sboot\lab055>



#Get all and view if any are there after switching to Integrations namespaces(as an example)

	PS C:\ws\sboot\lab053> kubectl config set-context --current --namespace=integrations
	Context "docker-desktop" modified.
	PS C:\ws\sboot\lab053>
	PS C:\ws\sboot\lab053> kubectl get all
	No resources found in integrations namespace.
	PS C:\ws\sboot\lab053>
	PS C:\ws\sboot\lab053>

#Check the deployment configuration

    type deployment.yaml

      PS C:\ws\sboot\lab055> type deployment.yaml



#Deploy the project to local kubernetes.

  kubectl apply -f deployment.yaml

    PS C:\ws\sboot\lab055>   kubectl apply -f deployment.yaml
    deployment.apps/hworld-deployment created
    service/hworld-service created
    PS C:\ws\sboot\lab055>


#Get all resources

    kubectl get all

    PS C:\ws\sboot\lab055> kubectl get all
    NAME                                     READY   STATUS    RESTARTS   AGE
    pod/hworld-deployment-79fd6df785-p9jhl   1/1     Running   0          6s

    NAME                     TYPE       CLUSTER-IP     EXTERNAL-IP   PORT(S)          AGE
    service/hworld-service   NodePort   10.96.192.86   <none>        8080:30080/TCP   10m

    NAME                                READY   UP-TO-DATE   AVAILABLE   AGE
    deployment.apps/hworld-deployment   1/1     1            1           10m

    NAME                                           DESIRED   CURRENT   READY   AGE
    replicaset.apps/hworld-deployment-69db959895   0         0         0       10m
    replicaset.apps/hworld-deployment-79fd6df785   1         1         1       6s
    PS C:\ws\sboot\lab055>




#Access the service, which will result in failure

  curl http://localhost:30080

    PS C:\ws\sboot\lab055> curl http://localhost:30080
    curl : Unable to connect to the remote server
    At line:1 char:1
    + curl http://localhost:30080
    + ~~~~~~~~~~~~~~~~~~~~~~~~~~~
        + CategoryInfo          : InvalidOperation: (System.Net.HttpWebRequest:HttpWebRequest) [Invoke-WebRequest], WebException
        + FullyQualifiedErrorId : WebCmdletWebResponseException,Microsoft.PowerShell.Commands.InvokeWebRequestCommand

    PS C:\ws\sboot\lab055>



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


