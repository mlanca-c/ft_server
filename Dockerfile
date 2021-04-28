
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
	nginx \
	vim

# Nginx
COPY	srcs/config-nginx /etc/nginx/sites-available/config-nginx
RUN		rm -rf /etc/nginx/sites-available/default && \
		ln -s /etc/nginx/sites-available/config-nginx /etc/nginx/sites-enabled/config-nginx && \
		rm -rf /etc/nginx/sites-enabled/default && \
		rm -rf /var/www/html/index.nginx-debian.html
