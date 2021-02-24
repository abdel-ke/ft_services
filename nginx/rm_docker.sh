docker ps -a
echo "\n"
docker images
if (($1  == 1))
then
	echo "\n\n"
	docker rm $2
	docker image rm -f $3 $4
	echo "\n\n"
	docker ps -a
	echo "\n"
	docker images
fi