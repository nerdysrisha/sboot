

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

#Build, run, list the docker image. here as an example, added the project number

		docker build -t hworld054:latest .

      [+] Building 6.0s (10/10) FINISHED                                                                                                                                                                                                            docker:desktop-linux
       => [internal] load build definition from Dockerfile                                                                                                                                                                                                          0.0s
       => => transferring dockerfile: 608B                                                                                                                                                                                                                          0.0s
       => [internal] load metadata for docker.io/library/amazoncorretto:22                                                                                                                                                                                          1.8s
       => [auth] library/amazoncorretto:pull token for registry-1.docker.io                                                                                                                                                                                         0.0s
       => [internal] load .dockerignore                                                                                                                                                                                                                             0.0s
       => => transferring context: 2B                                                                                                                                                                                                                               0.0s
       => [1/4] FROM docker.io/library/amazoncorretto:22@sha256:2b8b5ddee9d1f991b3b9f848e3d400f8f8953df6d2c5e848b3d899f5345d327f                                                                                                                                    0.0s
       => => resolve docker.io/library/amazoncorretto:22@sha256:2b8b5ddee9d1f991b3b9f848e3d400f8f8953df6d2c5e848b3d899f5345d327f                                                                                                                                    0.0s
       => [internal] load build context                                                                                                                                                                                                                             1.0s
       => => transferring context: 20.04MB                                                                                                                                                                                                                          0.9s
       => CACHED [2/4] WORKDIR /app                                                                                                                                                                                                                                 0.0s
       => [3/4] COPY target/hworld-0.0.1-SNAPSHOT.jar /app/hworld-0.0.1-SNAPSHOT.jar                                                                                                                                                                                0.2s
       => [4/4] RUN chown -R root:root /app && chmod 555 /app && chmod 444 /app/hworld-0.0.1-SNAPSHOT.jar                                                                                                                                                           0.5s
       => exporting to image                                                                                                                                                                                                                                        2.2s
       => => exporting layers                                                                                                                                                                                                                                       1.5s
       => => exporting manifest sha256:8cfcb02d2ac7e5ce661bb43103cce7b3f346c316f1281f2306fa37a1c550651d                                                                                                                                                             0.0s
       => => exporting config sha256:0f01d6ef878b2f4902d1923fb8eaaff3e7cecd99ac6615807220097e0d45d915                                                                                                                                                               0.0s
       => => exporting attestation manifest sha256:10fca1dcde73ab989ca87758d61c179ad6b4cee771f5f94a6b4bbda232f3877a                                                                                                                                                 0.1s
       => => exporting manifest list sha256:17f36e680186611bd7e94ab1250ff03ed5750881c89246bd4fe6eff60b1fcf2f                                                                                                                                                        0.0s
       => => naming to docker.io/library/hworld054:latest                                                                                                                                                                                                           0.0s
       => => unpacking to docker.io/library/hworld054:latest                                                                                                                                                                                                        0.5s
      PS C:\ws\sboot\lab054>


#Check if image is created and hosted on docker local

		docker images


      PS C:\ws\sboot\lab054> docker images
      REPOSITORY                                      TAG                                                                           IMAGE ID       CREATED          SIZE
      hworld054                                       latest                                                                        17f36e680186   45 seconds ago   796MB
      hworld                                          latest                                                                        68bed9888e78   15 hours ago     758MB
      nerdysrisha/hworld                              latest                                                                        68bed9888e78   15 hours ago     758MB
      curlimages/curl                                 latest                                                                        4026b29997dc   5 weeks ago      9.85MB
      docker/desktop-kubernetes                       kubernetes-v1.31.4-cni-v1.6.0-critools-v1.31.1-cri-dockerd-v0.3.15-1-debian   1405239673ef   8 months ago     577MB


#Run the docker image locally

		docker run -p 8080:8080 hworld054:latest


		PS C:\ws\sboot\lab054> docker run -p 8080:8080 hworld:latest


    2025-08-27T07:29:50.041Z  INFO 1 --- [bringlabs] [           main] com.bring.lab.Lab1Application            : Starting Lab1Application v0.0.1-SNAPSHOT using Java 22.0.2 with PID 1 (/app/hworld-0.0.1-SNAPSHOT.jar started by ? in /app)
    2025-08-27T07:29:50.046Z  INFO 1 --- [bringlabs] [           main] com.bring.lab.Lab1Application            : No active profile set, falling back to 1 default profile: "default"
    2025-08-27T07:29:51.363Z  INFO 1 --- [bringlabs] [           main] o.s.b.w.embedded.tomcat.TomcatWebServer  : Tomcat initialized with port 8080 (http)
    2025-08-27T07:29:51.391Z  INFO 1 --- [bringlabs] [           main] o.apache.catalina.core.StandardService   : Starting service [Tomcat]
    2025-08-27T07:29:51.392Z  INFO 1 --- [bringlabs] [           main] o.apache.catalina.core.StandardEngine    : Starting Servlet engine: [Apache Tomcat/10.1.30]
    2025-08-27T07:29:51.435Z  INFO 1 --- [bringlabs] [           main] o.a.c.c.C.[Tomcat].[localhost].[/]       : Initializing Spring embedded WebApplicationContext
    2025-08-27T07:29:51.436Z  INFO 1 --- [bringlabs] [           main] w.s.c.ServletWebServerApplicationContext : Root WebApplicationContext: initialization completed in 1306 ms
    2025-08-27T07:29:51.964Z  INFO 1 --- [bringlabs] [           main] o.s.b.w.embedded.tomcat.TomcatWebServer  : Tomcat started on port 8080 (http) with context path '/'
    2025-08-27T07:29:52.005Z  INFO 1 --- [bringlabs] [           main] com.bring.lab.Lab1Application            : Started Lab1Application in 2.552 seconds (process running for 3.45)




#in another terminal
			docker container list



        PS C:\ws\sboot> docker container list
        CONTAINER ID   IMAGE              COMMAND                  CREATED          STATUS          PORTS                    NAMES
        ba6e5f5c9e79   hworld054:latest   "java -jar hworld-0.…"   37 seconds ago   Up 36 seconds   0.0.0.0:8080->8080/tcp   admiring_hermann
        PS C:\ws\sboot>



#Run the curl
		 curl http://localhost:8080





#Docker Tag the image

docker tag hworld:latest hworld054:latest

    PS C:\ws\sboot\lab054> docker tag hworld:latest hworld054:latest
    PS C:\ws\sboot\lab054> docker images
    REPOSITORY                                      TAG                                                                           IMAGE ID       CREATED          SIZE
    nerdysrisha/hworld054                           latest                                                                        17f36e680186   41 minutes ago   796MB
    hworld054                                       latest                                                                        68bed9888e78   15 hours ago     758MB
    hworld                                          latest                                                                        68bed9888e78   15 hours ago     758MB


#Docker push the image to public Docker Hub

  docker push nerdysrisha/hworld054:latest

      PS C:\ws\sboot\lab054> docker push nerdysrisha/hworld054:latest
      The push refers to repository [docker.io/nerdysrisha/hworld054]
      15f72e6482a1: Pushed
      5fe405ca6282: Mounted from nerdysrisha/hworld
      90aa495d4610: Pushed
      5acaf245b957: Mounted from nerdysrisha/hworld
      31945a6db082: Mounted from nerdysrisha/hworld
      da412e841fea: Pushed
      latest: digest: sha256:17f36e680186611bd7e94ab1250ff03ed5750881c89246bd4fe6eff60b1fcf2f size: 856
      PS C:\ws\sboot\lab054>






#Apply deployment.yaml to local k8


  kubectl delete -f deployment.yaml

	PS C:\ws\sboot\lab053> kubectl delete -f deployment.yaml
	Error from server (NotFound): error when deleting "deployment.yaml": deployments.apps "hworld-deployment" not found
	Error from server (NotFound): error when deleting "deployment.yaml": services "hworld-service" not found
	PS C:\ws\sboot\lab053>

	or, if they exist get deleted.


	PS C:\ws\sboot\lab054> kubectl delete -f deployment.yaml
  deployment.apps "hworld-deployment" deleted
  service "hworld-service" deleted
  PS C:\ws\sboot\lab054>



#Get all and view if any are there after switching to Integrations namespaces(as an example)

	PS C:\ws\sboot\lab053> kubectl config set-context --current --namespace=integrations
	Context "docker-desktop" modified.
	PS C:\ws\sboot\lab053>
	PS C:\ws\sboot\lab053> kubectl get all
	No resources found in integrations namespace.
	PS C:\ws\sboot\lab053>
	PS C:\ws\sboot\lab053>

#Check the deployment configuration

      PS C:\ws\sboot\lab054> type deployment.yaml
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
                image: nerdysrisha/hworld054:latest
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
      PS C:\ws\sboot\lab054>




#Deploy the project to local kubernetes.

  kubectl apply -f deployment.yaml

	PS C:\ws\sboot\lab053> kubectl apply -f deployment.yaml
	deployment.apps/hworld-deployment created
	service/hworld-service created
	PS C:\ws\sboot\lab053>


#Get all resources

    kubectl get all

    PS C:\ws\sboot\lab054> kubectl get all
    NAME                                     READY   STATUS    RESTARTS   AGE
    pod/hworld-deployment-79d884c8d7-8h5ss   1/1     Running   0          20s

    NAME                     TYPE       CLUSTER-IP     EXTERNAL-IP   PORT(S)          AGE
    service/hworld-service   NodePort   10.96.10.115   <none>        8080:30080/TCP   20s

    NAME                                READY   UP-TO-DATE   AVAILABLE   AGE
    deployment.apps/hworld-deployment   1/1     1            1           20s

    NAME                                           DESIRED   CURRENT   READY   AGE
    replicaset.apps/hworld-deployment-79d884c8d7   1         1         1       21s
    PS C:\ws\sboot\lab054>



#Access the service, which will result in failure

  curl http://localhost:30080

    PS C:\ws\sboot\lab054> curl http://localhost:30080
    curl : Unable to connect to the remote server
    At line:1 char:1
    + curl http://localhost:30080
    + ~~~~~~~~~~~~~~~~~~~~~~~~~~~
        + CategoryInfo          : InvalidOperation: (System.Net.HttpWebRequest:HttpWebRequest) [Invoke-WebRequest], WebException
        + FullyQualifiedErrorId : WebCmdletWebResponseException,Microsoft.PowerShell.Commands.InvokeWebRequestCommand

    PS C:\ws\sboot\lab054>



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


