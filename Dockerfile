FROM dockerfile/java:oracle-java7
MAINTAINER Christophe Billiard

RUN apt-get update && \
    wget http://dl.bintray.com/sbt/debian/sbt-0.13.7.deb -O /tmp/sbt.deb && \
    dpkg -i /tmp/sbt.deb && \
    rm -f /tmp/sbt.deb

# print versions
RUN java -version
# sbt --version returns code 1 instead of 0 thus "|| true"
RUN sbt --version || true

WORKDIR /root

CMD ["bash"]
