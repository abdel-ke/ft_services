FROM alpine:3.12.3

RUN apk update
RUN apk add nginx openrc
#Creating new user and group 'www' for nginx
RUN adduser -D -g 'www' www
#Create a directory for html files
RUN mkdir /www \
	&& chown -R www:www /var/lib/nginx \
	&& chown -R www:www /www \
	&& openrc && rc-status && touch /run/openrc/softlevel
#Configuration
RUN mv /etc/nginx/nginx.conf /etc/nginx/nginx.conf.orig
COPY src /tmp
#Configuring Nginx to listen to port 80 and process .html or .htm files
RUN cp /tmp/nginx.conf /etc/nginx/nginx.conf \
	&& cp /tmp/index.html /www/index.html \
	&& chmod +x /tmp/start_nginx.sh
#INSTALL OPENSSL
RUN add apk OPENSSL
RUN openssl req -x509 -nodes -days 365 \
	-subj "/C=CA/ST=QC/O=Company, Inc./CN=mydomain.com" \
	-addext "subjectAltName=DNS:mydomain.com" \
	-newkey rsa:2048 \
	-keyout /etc/ssl/private/nginx-selfsigned.key \
	-out /etc/ssl/certs/nginx-selfsigned.crt
	
CMD sh /tmp/start_nginx.sh