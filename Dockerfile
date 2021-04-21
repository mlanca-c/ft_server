# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: mlanca-c <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/04/20 10:26:47 by mlanca-c          #+#    #+#              #
#    Updated: 2021/04/21 15:33:05 by mlanca-c         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# Instal the base image, OS container.
# FROM instruction:
# FROM <image>[:<tag>]
FROM debian:buster

# Update and Upgrade software packages in debian 
# RUN instruction:
# RUN <shell_command>
RUN apt-get update
RUN apt-get upgrade -y

# The wget command will be used ...
RUN apt-get -y install wget

# Install Nginx
RUN apt-get -y install nginx
