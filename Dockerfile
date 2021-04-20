# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: mlanca-c <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/04/20 10:26:47 by mlanca-c          #+#    #+#              #
#    Updated: 2021/04/20 12:42:35 by mlanca-c         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# Format of a Dockerfile:
# INSTRUCTION arguments 

# FROM
# Used to create a base image. Other instuctions in the Dockerfile are going to
# modify this image.

# Docker base image: Docker base image is the basic image on which you add 
# layers (which are basically filesystem changes) and create a final image
# containing your App. 

# Installing debian buster as a base image:
FROM debian:buster

# Before installing other images, I need to update software packages in debian.
# command apt-get
RUN apt-get update && apt-get install –y \
# RUN apt-get -y install wget

# Install Nginx
# To access config file of nginx, run the docker by using below command in the 
# directory which your dockerfile locates.
RUN apt-get -y install nginx

# Install Wordpress
RUN apt-get -y install nginx

# Install PhpMyAdmin
RUN apt-get -y install php-fpm
#RUN apt-get -y install php7.3 php-mysql php-fpm php-pdo php-gd php-cli php-mbstring

# Install MySQL
RUN apt-get -y install php-mysql

# SSL Protocol

# Apply auto-index
