FROM java:8
RUN echo "deb http://jfrog.bintray.com/artifactory-debs jessie main" >> /etc/apt/sources.list
ENV ARTI_VERSION 4.5.2
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 6B219DCCD7639232
RUN apt-get update && \
	apt-get install -y jfrog-artifactory-oss=$ARTI_VERSION