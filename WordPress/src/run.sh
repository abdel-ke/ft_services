rc-status
rc-service nginx restart

sleep 2

while true;
do
	if ! pgrep nginx >/dev/null 2>&1 ; then
		echo "Nginx Server is down !"
		echo "Quitting.."
		exit 1
	else
		echo "Nginx is up!"
	fi
	sleep 2
done