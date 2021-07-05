#!/bin/bash
####################################################################
## ZOUPA - (ZombyMediaIC open source usage protection agreement)  ##
## License as of: 05.07.2021 15:00 | #202107051500                ##
## Niklas Vorberg (AsP3X)                                         ##
####################################################################

echo "###############################################"
echo "###############################################"
echo "      Warning indev is an unstable build       "
echo "     Do not under ANY CIRCUMSTANCES use it     "
echo "     for production or anything else exept     "
echo "           testing purposes only               "
echo "###############################################"
echo "###############################################"

sleep 4

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
	wget https://papermc.io/api/v2/projects/paper/versions/1.17/builds/75/downloads/paper-1.17-75.jar -O /temp/papermc.jar
	touch /temp/eula.txt
	echo "eula=true" > /temp/eula.txt
	sed -i -e 's/false/true/g' /temp/eula.txt
	cp /temp/papermc.jar /server
	cp /temp/eula.txt /server
	cp /temp/run.sh /server
	sleep 1
	screen -S Minecraft-Server /bin/sh -c "java -Xmx${RAM} -Xms${RAM} -jar papermc.jar"
fi
