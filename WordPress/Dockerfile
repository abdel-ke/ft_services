FROM alpine:3.12.3

RUN apk update
# RUN apk add lighttpd php7-common php7-iconv php7-json \
# 	php7-gd php7-curl php7-xml php7-mysqli php7-imap \
# 	php7-cgi fcgi php7-pdo php7-pdo_mysql php7-soap \
# 	php7-xmlrpc php7-posix php7-mcrypt php7-gettext \
# 	php7-ldap php7-ctype php7-dom
# RUN rc-service lighttpd start && rc-update add lighttpd default
# RUN apk add wget php5-mysql mysql mysql-client php5-zlib
# RUN mkdir -p /usr/share/webapps
# RUN wget http://wordpress.org/latest.tar.gz
# RUN chown -R lighttpd /usr/share/webapps/
# RUN ln -s /usr/share/webapps/wordpress/ /var/www/localhost/htdocs/wordpress
# RUN /usr/bin/mysql_install_db --user=mysql \
# 	/etc/init.d/mariadb start && rc-update add mariadb default \
# 	/usr/bin/mysqladmin -u root password 'password'
