FROM java:8

MAINTAINER Yossi Shaul <yoshaul@gmail.com>

# add Bintray to apt sources
RUN echo "deb http://jfrog.bintray.com/artifactory-debs jessie main" >> /etc/apt/sources.list

# add JFrog public key
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 6B219DCCD7639232

ENV ARTI_VERSION 4.5.2

# install Artifactory
RUN apt-get update && \
	apt-get install -y jfrog-artifactory-oss=$ARTI_VERSION

# expose port 8081
EXPOSE 8081
	
# start Artifactory service
CMD service artifactory start && tail -F /var/opt/jfrog/artifactory/logs/artifactory.log