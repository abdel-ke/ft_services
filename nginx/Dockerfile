FROM alpine:3.12.3

RUN apk update
RUN apk add nginx openrc
#Creating new user and group 'www' for nginx
RUN adduser -D -g 'www' www
#Create a directory for html files
RUN mkdir /www \
	&& chown -R www:www /var/lib/nginx \
	&& chown -R www:www /www
#Configuration
RUN mv /etc/nginx/nginx.conf /etc/nginx/nginx.conf.orig
COPY src /tmp
#Configuring Nginx to listen to port 80 and process .html or .htm files
RUN cp /tmp/nginx.conf /etc/nginx/nginx.conf
RUN cp /tmp/index.html /www/index.html
RUN openrc && touch /run/openrc/softlevel
RUN chmod +x /tmp/docker_rm.sh
CMD sh /tmp/docker_rm.sh