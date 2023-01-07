#!/bin/bash
####################################################################
## ZOUPA - (ZombyMediaIC open source usage protection agreement)  ##
## License as of: 10.07.2022 21:40 | #202207102140                ##
## Niklas Vorberg (AsP3X)                                         ##
####################################################################

if [[ "${allowSSH}" == "true" ]]; then
	service ssh start
else
	echo "SSH is disabled"
fi

if [ ! -f "/server/run.sh" ];
then
	/serverfiles/run.sh
else
	chmod 755 /server/run.sh
	/server/run.sh
fi