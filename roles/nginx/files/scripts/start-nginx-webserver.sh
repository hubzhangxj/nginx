
#!/bin/sh

TOPDIR=`pwd`

CONF_FILE=nginx.conf.webserver

source scripts/profile

setup_webserver()
{
	if [ ! -f $NGINX_PATH/conf/$CONF_FILE ]; then
		cp conf/nginx/$CONF_FILE $NGINX_PATH/conf/
	fi
}

setup_webserver

# start nginx
echo "Stop nginx ..."
$NGINX_PATH/sbin/nginx -s stop
sleep 1
echo "Start nginx ..."
$NGINX_PATH/sbin/nginx -c $NGINX_PATH/conf/$CONF_FILE
sleep 1
ps -ef | grep nginx | grep -v grep | grep -v "start-nginx" | wc -l

# stop nginx
#$NGINX_PATH/sbin/nginx -s stop

# reload nginx
#$NGINX_PATH/sbin/nginx -s reload
