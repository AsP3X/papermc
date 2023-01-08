####################################################################
## ZOUPA - (ZombyMediaIC open source usage protection agreement)  ##
## License as of: 07.06.2021 22:40 | #202106072240                ##
## Niklas Vorberg (AsP3X)                                         ##
####################################################################

FROM alpine:latest
LABEL org.opencontainers.image.authors="ZombyMediaIC"

RUN apk update
RUN apk upgrade

RUN apk add wget openjdk11 screen nano mysql-client

WORKDIR server

RUN mkdir /temp
RUN mkdir /serverfiles
COPY ./run.sh /serverfiles
COPY ./init.sh /serverfiles
COPY ./serverfiles/eula.txt /temp
COPY ./run.sh /temp

RUN chmod -R 777 /serverfiles
EXPOSE 25565

CMD "/serverfiles/init.sh"