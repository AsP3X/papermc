#!/bin/sh
####################################################################
## ZOUPA - (ZombyMediaIC open source usage protection agreement)  ##
## License as of: 19.07.2021 10:32 | #202107191032                ##
## Niklas Vorberg (AsP3X)                                         ##
####################################################################

JARFILE=/server/papermc.jar
if test -f "$JARFILE"; then
	screen -S Minecraft-Server /bin/sh -c "java -Xmx4096M -Xms4069M -jar papermc.jar"
else
	echo "Creating new Files"
	wget https://papermc.io/api/v2/projects/paper/versions/1.16.5/builds/786/downloads/paper-1.16.5-786.jar -O /temp/papermc.jar
	touch /temp/eula.txt
	echo "eula=true" > /temp/eula.txt
	sed -i -e 's/false/true/g' /temp/eula.txt
	cp /temp/papermc.jar /server
	cp /temp/eula.txt /server
	cp /temp/run.sh /server
	sleep 1
	screen -S Minecraft-Server /bin/sh -c "java -Xmx4096M -Xms4096M -jar papermc.jar"
fi
