#!/bin/bash
####################################################################
## ZOUPA - (ZombyMediaIC open source usage protection agreement)  ##
## License as of: 07.06.2021 22:40 | #202106072240                ##
## Niklas Vorberg (AsP3X)                                         ##
####################################################################

if [[ "${RAM}" ]]; then
	echo "Using ${RAM}"
else
	echo "Set ram to default of 4G"
	RAM=4G
fi

JARFILE=/server/papermc.jar
if test -f "$JARFILE"; then
	screen -S Minecraft-Server /bin/sh -c "java -Xmx${RAM} -Xms${RAM} -jar papermc.jar"
else
	echo "Creating new Files"
	wget https://papermc.io/api/v2/projects/paper/versions/1.16.5/builds/770/downloads/paper-1.16.5-770.jar -O /temp/papermc.jar
	touch /temp/eula.txt
	echo "eula=true" > /temp/eula.txt
	sed -i -e 's/false/true/g' /temp/eula.txt
	cp /temp/papermc.jar /server
	cp /temp/eula.txt /server
	cp /temp/run.sh /server
	sleep 1
	screen -S Minecraft-Server /bin/sh -c "java -Xmx${RAM} -Xms${RAM} -jar papermc.jar"
fi
