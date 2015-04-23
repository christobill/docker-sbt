FROM ubuntu:14.04
MAINTAINER Christophe Billiard

RUN apt-get update

# install add-apt-repository tool (if we want to use debian)
#RUN apt-get install -y python-software-properties

RUN apt-get update && \
    apt-get -y install git wget unzip software-properties-common && \
    add-apt-repository ppa:webupd8team/java && \
    apt-get update && \
    apt-get -y upgrade && \
    echo oracle-java7-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections && \
    apt-get -y install oracle-java7-installer && \
    apt-get clean && \
    apt-get purge && \
    echo "JAVA_HOME=/usr/lib/jvm/java-7-oracle" >> /etc/environment && \
    wget http://dl.bintray.com/sbt/debian/sbt-0.13.7.deb -O /tmp/sbt.deb && \
    dpkg -i /tmp/sbt.deb && \
    rm -f /tmp/sbt.deb

# print versions
RUN java -version
# sbt --version returns code 1 instead of 0 thus "|| true"
RUN sbt --version || true

WORKDIR /root
