####################################################################
## ZOUPA - (ZombyMediaIC open source usage protection agreement)  ##
## License as of: 10.07.2022 21:40 | #202207102140                ##
## Niklas Vorberg (AsP3X)                                         ##
####################################################################

FROM zombymediaic/java:v17.0.6-ubuntu
LABEL org.opencontainers.image.authors="ZombyMediaIC"

RUN apt-get update

RUN echo "You can change this later"
ENV RAM="4G"

RUN apt-get install -y screen mysql-client dpkg net-tools

# ## Installing java16 as openjdk from java.net
# RUN mkdir /usr/lib/jvm
# RUN wget https://download.java.net/java/GA/jdk17.0.2/dfd4a8d0985749f896bed50d7138ee7f/8/GPL/openjdk-17.0.2_linux-x64_bin.tar.gz
# RUN tar -xvf openjdk-17.0.2_linux-x64_bin.tar.gz -C /usr/lib/jvm/
# RUN ln -s /usr/lib/jvm/jdk-17 /usr/lib/jvm/jdk-17.0.2
# RUN update-alternatives --install /usr/bin/java java /usr/lib/jvm/jdk-17.0.2/bin/java 100
# RUN update-alternatives --install /usr/bin/javac javac /usr/lib/jvm/jdk-17.0.2/bin/javac 100

# RUN update-alternatives --display java
# RUN update-alternatives --display javac

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
