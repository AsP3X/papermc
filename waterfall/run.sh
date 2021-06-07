#!/bin/sh
####################################################################
## ZOUPA - (ZombyMediaIC open source usage protection agreement)  ##
## License as of: 07.06.2021 22:40 | #202106072240                ##
## Niklas Vorberg (AsP3X)                                         ##
####################################################################

JARFILE=/server/waterfall.jar
if test -f "$JARFILE"; then
        screen -S Minecraft-Server /bin/sh -c "java -Xmx1024M -Xms1024M -jar waterfall.jar"
else
        wget https://papermc.io/api/v2/projects/waterfall/versions/1.16/builds/421/downloads/waterfall-1.16-421.jar -O waterfall.jar
        touch eula.txt
        echo "eula=true" > eula.txt
        sed -i -e 's/false/true/g' eula.txt
        screen -S Minecraft-Server /bin/sh -c "java -Xmx1024M -Xms1024M -jar waterfall.jar"
fi

