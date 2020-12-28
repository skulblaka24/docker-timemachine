#!/bin/bash

set -e

if [ ! -e /.initialized_user ]; then
	# User are to be added here
	# USERNAME PASSWORD VOL_NAME VOL_ROOT
	add-account gauth Skulblaka24 Time_Machine_Gauth /timemachine/gauth
    add-account olivia Olivia24 Time_Machine_Oliv /timemachine/olivia	
	touch /.initialized_user
fi

if [ ! -e /.initialized_user ] && [ ! -z "$SMB_LOGIN" ] && [ ! -z "$SMB_PASSWORD" ] && [ ! -z "$SMB_NAME" ] && [ ! -z $PUID ] && [ ! -z $PGID ]; then
    add-account -i $PUID -g $PGID "$SMB_LOGIN" "$SMB_PASSWORD" "$SMB_NAME" /timemachine
    touch /.initialized_user
fi

exec /usr/bin/supervisord -c /etc/supervisor/conf.d/supervisord.conf
