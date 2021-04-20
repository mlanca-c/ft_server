# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    how.md                                             :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: mlanca-c <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/04/20 12:58:40 by mlanca-c          #+#    #+#              #
#    Updated: 2021/04/20 13:07:28 by mlanca-c         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# Steps of project

 * [Step 1:]() Create the ```base image```. In this case The OS - ```Debian Buster```.
 * [Step 2:]() Update the ```OS``` and install ```nginx```.

# Step 1

 ```vim
 # Syntax: FROM image:tag
 FROM debian:buster
 ```

 The ```FROM``` instruction sets the ```base image``` for the subsequent instructions. It creates an image on which you add layers, for then create the final image containing your app.

 > **Base Image:** 
