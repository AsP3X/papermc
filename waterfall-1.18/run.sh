#!/bin/sh
####################################################################
## ZOUPA - (ZombyMediaIC open source usage protection agreement)  ##
## License as of: 05.06.2021 15:00 | #202107051500                ##
## Niklas Vorberg (AsP3X)                                         ##
####################################################################

JARFILE=/server/waterfall.jar
if test -f "$JARFILE"; then
        screen -S Minecraft-Server /bin/sh -c "java -Xmx1024M -Xms1024M -jar waterfall.jar"
else
        wget https://papermc.io/api/v2/projects/waterfall/versions/1.18/builds/483/downloads/waterfall-1.18-483.jar -O waterfall.jar
        touch eula.txt
        echo "eula=true" > eula.txt
        sed -i -e 's/false/true/g' eula.txt
        screen -S Minecraft-Server /bin/sh -c "java -Xmx1024M -Xms1024M -jar waterfall.jar"
fi

