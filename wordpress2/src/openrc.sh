telegraf &

rc-update add nginx default && rc-update add php-fpm7 default
rc-service nginx restart 
rc-service php-fpm7 restart

sleep 3
while true;
do
	if ! pgrep nginx >/dev/null 2>&1 ; then
		echo "Nginx Server is down !"
		echo "Quitting.."
		exit 1
	else
		echo "Nginx is up!"
	fi
	if ! pgrep php-fpm7 >/dev/null 2>&1 ; then
		echo "php-fpm7 service is down !"
		echo "Quitting.."
		exit 1
	else
		echo "php-fpm7 is up!"
	fi
	if ! pgrep telegraf >/dev/null 2>&1 ; then
		echo "telegraf is down !"
		echo "Quitting.."
		exit 1
	else
		echo "telegraf is up!"
	fi
	sleep 2
done