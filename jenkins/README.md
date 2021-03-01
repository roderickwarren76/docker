This is the root file for testing Jenkins within a Docker

Currently running:

docker run -d -v jenkins_home:/var/jenkins_home -p 8080:8080 -p 50000:50000 jenkins/jenkins:lts

Simply do a sudo docker start <image-name> to start the container
$ sudo docker start <image-name>
