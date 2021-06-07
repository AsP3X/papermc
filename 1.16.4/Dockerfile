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
COPY ./run.sh /server

EXPOSE 25565

COPY run.sh /server
RUN chmod 777 run.sh
CMD "./run.sh"
