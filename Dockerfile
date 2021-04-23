# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: mlanca-c <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/04/23 18:50:58 by mlanca-c          #+#    #+#              #
#    Updated: 2021/04/23 19:00:41 by mlanca-c         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM debian:buster

RUN apt-get update && \
	apt-get upgrade -y && \
	apt-get -y install wget -y \
	nginx \
    mariadb-server \
    php-fpm \
    php-mysql \
    php-mbstring \
	vim

#NGINX
COPY	srcs/nginx/server.conf /etc/nginx/sites-available/server.conf
RUN		rm -rf /etc/nginx/sites-available/default && \
		ln -s /etc/nginx/sites-available/server.conf /etc/nginx/sites-enabled/server.conf && \
		rm -rf /etc/nginx/sites-enabled/default && \
		rm -rf /var/www/html/index.nginx-debian.html

#PhpMyAdmin
RUN wget https://files.phpmyadmin.net/phpMyAdmin/5.0.2/phpMyAdmin-5.0.2-english.tar.gz && \
	tar -xzvf phpMyAdmin-5.0.2-english.tar.gz && \
	rm -rf phpMyAdmin-5.0.2-english.tar.gz && \
	mv phpMyAdmin-5.0.2-english /var/www/html/phpmyadmin
COPY srcs/phpmyadmin/config.inc.php var/www/html/phpmyadmin

#WordPress
RUN wget https://wordpress.org/latest.tar.gz && \
	tar -xvzf latest.tar.gz && rm -rf latest.tar.gz && \
	mv wordpress /var/www/html/
COPY srcs/wordpress/wp-config.php var/www/html/wordpress

#SSL
RUN mkdir ~/mkcert && cd ~/mkcert && \
	wget https://github.com/FiloSottile/mkcert/releases/download/v1.4.1/mkcert-v1.4.1-linux-amd64 && \
	mv mkcert-v1.4.1-linux-amd64 mkcert && chmod +x mkcert && \
	./mkcert -install && ./mkcert localhost

#Give Rights
RUN chown -R www-data:www-data /var/www/html/*

EXPOSE 80 443
COPY	srcs/start.sh . /
CMD		bash start.sh
