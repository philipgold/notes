# Run Jenkins on Docker
Setup for one master.


First, pull the official jenkins image from Docker repository.
```
docker pull jenkins/jenkins:lts
```
To best follow along, a working example can be run once you have Docker installed. Simply execute the command below in your terminal:
* inside the container 
```
docker run --name jenkins -p 8080:8080
```

* mounted from a data volume container 
```
docker run --name jenkins -p 8080:8080 -v /var/jenkins_home
```

* advanced mode 
```
docker run -u root --rm -d -p 8080:8080 -p 50000:50000 -v jenkins-data:/var/jenkins_home -v /var/run/docker.sock:/var/run/docker.sock jenkins/jenkins:lts 
```
# Post-installation setup wizard
After downloading, installing and running Jenkins using one of the procedures above, the post-installation setup wizard begins.

This setup wizard takes you through are a few quick "one-off" steps to unlock Jenkins, customize it with plugins and create the first administrator user through which you can continue accessing Jenkins.

## Unlocking Jenkins
When you first access a new Jenkins instance, you are asked to unlock it using an automatically-generated password.
1. Browse to http://localhost:8080 (or whichever port you configured for Jenkins when installing it) and wait until the Unlock Jenkins page appears.
2. From the Jenkins console log output, copy the automatically-generated alphanumeric password (between the 2 sets of asterisks).




## Install required global tools



1. JDK installation
2. Maven installation

Note: add manually here http://localhost:8080/configureTools/


## Install required plugins 
Run the script manually in Dockerfile:
```
FROM jenkins/jenkins:lts
COPY plugins.txt /usr/share/jenkins/ref/plugins.txt
RUN /usr/local/bin/install-plugins.sh < /usr/share/jenkins/ref/plugins.txt
```
[Sample of plugins.txt](https://github.com/fabric8io/jenkins-docker/blob/master/plugins.txt)


### Links
* [Official Jenkins Docker image](https://github.com/jenkinsci/docker/blob/master/README.md)
* [Installing Jenkins](https://jenkins.io/doc/book/installing)

* [Dockerized jenkins master/slave setup](https://visibilityspots.org/dockerized-jenkins.html)


## Known issues

### Generate a plugins.txt from an existing jenkins instance
Use the following .groovy script
```groovy
Jenkins.instance.pluginManager.plugins.each{
  plugin -> 
    println ("${plugin.getShortName()}: ${plugin.getVersion()}")
}
```
This can be executed from the "Script" console at https://YOUR_JENKINS_URL/script (assuming you are admin)

source: https://github.com/jenkinsci/docker/issues/336


--driver-memory 1G --num-executors 1 --executor-memory 1G

spark-submit --class il.nayatech.producer.Player --master yarn --deploy-mode cluster --num-executors 1 --driver-memory 512M --executor-memory 512M hdfs://ip-172-31-32-200.eu-west-1.compute.internal:8020/jars/cads-player-1.0-SNAPSHOT.jar

### Cannot run program "mvn"
Problem: Got exeption ``Cannot run program "mvn"`` while run a job

Resolution: Install Maven 

## References

1   https://stackoverflow.com/questions/26906972/cannot-run-program-mvn-error-2-no-such-file-or-directory

2   https://blog.couchbase.com/deployment-pipeline-docker-jenkins-java-couchbase/

3 https://dzone.com/articles/how-to-use-the-jenkins-declarative-pipeline 

docker run --restart unless-stopped -u root -d -p 8080:8080 -p 50000:50000 -v jenkins-data:/var/jenkins_home -v /var/run/docker.sock:/var/run/docker.sock jenkins/jenkins:lts



An end-to-end tutorial to Continuous Integration and Continuous Delivery by Dockerize Jenkins Pipeline 
https://medium.com/@hakdogan/an-end-to-end-tutorial-to-continuous-integration-and-continuous-delivery-by-dockerize-jenkins-f5b9b45b610d


docker-compose: command not found on jenkins
https://stackoverflow.com/questions/48481322/docker-compose-command-not-found-on-jenkins