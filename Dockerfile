# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: mlanca-c <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/04/28 12:18:42 by mlanca-c          #+#    #+#              #
#    Updated: 2021/04/28 16:29:37 by mlanca-c         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# The FROM instruction creates the base image for the container. In this case,
# the base image will serve as the OS - Debian 10 or Debian Buster.
FROM debian:buster


# The RUN instruction runs a command om top of the current image.
# First it updates and installs all software packages for Debian.
# Then it installs wget. Wget command will be used to get .tar files of 
# PhpMyAdmin and WordPress.
# After that, it installs Nginx, MariaDB, and some PHP extensions:
	# php-fmp Fast Proccess Manager: PHP-FPM includes numerous features that can 
		# prove beneficial for websites receiving traffic in large volumes frequently.
	# php-mysql: for php code to run under Nginx sserver and talk to our MySQL 
		# database.
	# php-mbstring: manages non-ASCII strings and converts strings to different 
		# encodings.
# The -y flag is for auto "yes".
RUN apt-get update && \
	apt-get upgrade -y && \
	apt-get -y install wget \
	mariadb-server \
	nginx \
	php-fpm \
	php-mysql \
	php-mbstring \
	vim

# Nginx
COPY	srcs/config-nginx /etc/nginx/sites-available/config-nginx
RUN		rm -rf /etc/nginx/sites-available/default && \
		ln -s /etc/nginx/sites-available/config-nginx /etc/nginx/sites-enabled/config-nginx && \
		rm -rf /etc/nginx/sites-enabled/default && \
		rm -rf /var/www/html/index.nginx-debian.html

# PhpMyAdmin
RUN wget https://files.phpmyadmin.net/phpMyAdmin/5.0.2/phpMyAdmin-5.0.2-english.tar.gz && \
	tar -xzvf phpMyAdmin-5.0.2-english.tar.gz && \
	rm -rf phpMyAdmin-5.0.2-english.tar.gz && \
	mv phpMyAdmin-5.0.2-english /var/www/html/phpmyadmin
COPY srcs/config.inc.php var/www/html/phpmyadmin

# WordPress
RUN wget https://wordpress.org/latest.tar.gz && \
	tar -xvzf latest.tar.gz && rm -rf latest.tar.gz && \
	mv wordpress /var/www/html/
COPY srcs/wp-config.php var/www/html/wordpress

EXPOSE 80 443

COPY	srcs/start.sh . /
CMD		bash start.sh
