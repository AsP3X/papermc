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