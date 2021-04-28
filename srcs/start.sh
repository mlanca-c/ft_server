# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    start.sh                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: mlanca-c <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/04/28 12:42:34 by mlanca-c          #+#    #+#              #
#    Updated: 2021/04/28 16:16:09 by mlanca-c         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# Generating SSL private and public key
# openssl is the tool. 
#
# openssl req -newkey <arg>		this option generates a new certificate request
# 								and a new private key.
#								The <arg> can take several forms - in this case:
#
# -newkey rsa:bits 				generate a new RSA key of 'bits' in size.
#
# -x509 				This is a standard format for public key certificates.
# -sha256				This is a message digest command.
#						It's to use the sha256 message digest algorithm.

mkdir /etc/nginx/ssl
openssl req -newkey rsa:4096 \
			-x509 \
			-sha256 \
			-days 3650 \
			-nodes \
			-out /etc/nginx/ssl/ssl-bundle.crt \
			-keyout /etc/nginx/ssl/ssl-bundle.key \
			-subj "/C=PT/ST=Lisbon/L=Lisbon/O=42 Lisboa/OU=mlanca/CN=www.localhost.com"

# Service NGINX
service nginx start
nginx -t
service nginx status

# Service php
service php7.3-fpm start
service php7.3-fpm status

# Service Mariadb
service mysql start
service mysql status

# Wordpress conf
echo "CREATE DATABASE wordpress;"| mysql -u root --skip-password
echo "GRANT ALL PRIVILEGES ON wordpress.* TO 'root'@'localhost' WITH GRANT OPTION;"| mysql -u root --skip-password
echo "FLUSH PRIVILEGES;"| mysql -u root --skip-password
echo "update mysql.user set plugin='' where user='root';"| mysql -u root --skip-password

bash
