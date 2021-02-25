docker ps -a
echo "\n"
docker images
if (($1  == 1))
then
	echo "\n\n"
	docker rm -f $(docker ps -a -q)
fi