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

# Instal the base image, OS container.
# FROM instruction:
# FROM <image>[:<tag>]
FROM debian:buster

# Update 
# RUN instruction:
# RUN <shell_command>
RUN apt-get upgrade

