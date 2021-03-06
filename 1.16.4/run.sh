#!/bin/sh
####################################################################
## ZOUPA - (ZombyMediaIC open source usage protection agreement)  ##
## License as of: 07.06.2021 22:40 | #202106072240                ##
## Niklas Vorberg (AsP3X)                                         ##
####################################################################

echo "###############################################"
echo "###############################################"
echo "       Warning this build is deprecated        "
echo "  and will no longer be updated and supported  "
echo "                                               "
echo "     Do not under ANY CIRCUMSTANCES use it     "
echo "     for production or anything else exept     "
echo "       testing and private purposes only       "
echo "###############################################"
echo "###############################################"

sleep 4

JARFILE=/server/papermc.jar
if test -f "$JARFILE"; then
	screen -S Minecraft-Server /bin/sh -c "java -Xmx4096M -Xms4069M -jar papermc.jar"
else
	wget https://papermc.io/api/v2/projects/paper/versions/1.16.4/builds/416/downloads/paper-1.16.4-416.jar -O papermc.jar
	touch eula.txt
	echo "eula=true" > eula.txt
	sed -i -e 's/false/true/g' eula.txt
	screen -S Minecraft-Server /bin/sh -c "java -Xmx4096M -Xms4096M -jar papermc.jar"
fi
