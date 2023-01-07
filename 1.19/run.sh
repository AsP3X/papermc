#!/bin/bash
####################################################################
## ZOUPA - (ZombyMediaIC open source usage protection agreement)  ##
## License as of: 10.07.2022 21:40 | #202207102140                ##
## Niklas Vorberg (AsP3X)                                         ##
####################################################################

echo "###############################################"
echo "###############################################"
echo "       Warning this build is deprecated        "
echo "  and will no longer receive version updates   "
echo "     server packages will still be updated     "
echo "                                               "
echo "     Do not under ANY CIRCUMSTANCES use it     "
echo "     for production or anything else exept     "
echo "       testing and private purposes only       "
echo "###############################################"
echo "###############################################"

sleep 4

if [[ "${RAM}" ]]; then
	echo "Using ${RAM}"
else
	echo "Set ram to default of 4G"
	echo "This can be changed later"
	RAM=4G
fi

JARFILE=/server/papermc.jar
if test -f "$JARFILE"; then
	screen -S Minecraft-Server /bin/sh -c "java -Xmx${RAM} -Xms${RAM} -jar papermc.jar"
else
	echo "Creating new Files"
	wget https://api.papermc.io/v2/projects/paper/versions/1.19.1/builds/111/downloads/paper-1.19.1-111.jar -O /temp/papermc.jar
	touch /temp/eula.txt
	echo "eula=true" > /temp/eula.txt
	sed -i -e 's/false/true/g' /temp/eula.txt
	cp /temp/papermc.jar /server
	cp /temp/eula.txt /server
	cp /temp/run.sh /server
	sleep 1
	screen -S Minecraft-Server /bin/sh -c "java -Xmx${RAM} -Xms${RAM} -jar papermc.jar"
fi
