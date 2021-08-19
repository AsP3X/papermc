####################################################################
## ZOUPA - (ZombyMediaIC open source usage protection agreement)  ##
## License as of: 07.06.2021 22:40 | #202106072240                ##
## Niklas Vorberg (AsP3X)                                         ##
####################################################################

FROM ubuntu:latest
LABEL org.opencontainers.image.authors="ZombyMediaIC"

RUN cd /etc/apt && sed -i 's/us\./de\./g' sources.list

RUN apt-get update
RUN apt-get upgrade -y

RUN echo "You can change this later"
ENV RAM="4G"

RUN apt-get install -y wget screen nano mysql-client dpkg tar net-tools

## Installing java16 as openjdk from java.net
RUN mkdir /usr/lib/jvm
RUN wget https://download.java.net/java/GA/jdk16.0.1/7147401fd7354114ac51ef3e1328291f/9/GPL/openjdk-16.0.1_linux-x64_bin.tar.gz
RUN tar -xvf openjdk-16.0.1_linux-x64_bin.tar.gz -C /usr/lib/jvm/
RUN ln -s /usr/lib/jvm/jdk-13 /usr/lib/jvm/jdk-16.0.1
RUN update-alternatives --install /usr/bin/java java /usr/lib/jvm/jdk-16.0.1/bin/java 100
RUN update-alternatives --install /usr/bin/javac javac /usr/lib/jvm/jdk-16.0.1/bin/javac 100

RUN update-alternatives --display java
RUN update-alternatives --display javac

## Creating server directory for server creation process
WORKDIR /server

## Copying all nesessary files to temp dir
RUN mkdir /temp
RUN mkdir /serverfiles
COPY ./run.sh /serverfiles
COPY ./init.sh /serverfiles
COPY ./serverfiles/eula.txt /temp
COPY ./run.sh /temp

# Installing ssh-server into image
RUN apt update && apt install  openssh-server -y
RUN echo 'root:ultimatePassword' | chpasswd
RUN echo "PermitRootLogin yes" > /etc/ssh/sshd_config
RUN service ssh start
EXPOSE 22

RUN chmod -R 777 /serverfiles
EXPOSE 25565

CMD "/serverfiles/init.sh"
