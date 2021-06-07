#!/bin/sh
####################################################################
## ZOUPA - (ZombyMediaIC open source usage protection agreement)  ##
## License as of: 07.06.2021 22:40 | #202106072240                ##
## Niklas Vorberg (AsP3X)                                         ##
####################################################################

if [ ! -f "/server/run.sh" ];
then
	/serverfiles/run.sh
else
	chmod 755 /server/run.sh
	/server/run.sh
fi

#while true; do
#    sleep 5
#    echo "persistance mode"
#    serversession=$(screen -list | grep "Minecraft")
#
#  if [[ $serversession ]];
#  then
#    if [[ $serversession == *"Attached"* ]]; then
#  	echo "session is still attached"
#    else
#	echo "Reattaching..."
#	sleep 1
#  	screen -x
#    fi
#  else
#    echo "Restarting server"
#    chmod 755 /server/run.sh
#    /server/run.sh
#  fi
#
#done
