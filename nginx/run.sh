docker build -t nginx_img .
docker run -it --name nginx_cnt -p 80:80 -p 443:443 nginx_img