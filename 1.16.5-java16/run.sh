#!/bin/bash
####################################################################
## ZOUPA - (ZombyMediaIC open source usage protection agreement)  ##
## License as of: 19.07.2021 10:32 | #202107191032                ##
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
	wget https://api.papermc.io/v2/projects/paper/versions/1.16.5/builds/794/downloads/paper-1.16.5-794.jar -O /temp/papermc.jar
	touch /temp/eula.txt
	echo "eula=true" > /temp/eula.txt
	sed -i -e 's/false/true/g' /temp/eula.txt
	cp /temp/papermc.jar /server
	cp /temp/eula.txt /server
	cp /temp/run.sh /server
	sleep 1
	screen -S Minecraft-Server /bin/sh -c "java -Xmx${RAM} -Xms${RAM} -jar papermc.jar"
fi
