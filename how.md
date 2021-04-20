# Steps of project

 * [Step 1:](https://github.com/mlanca-c/ft_server/blob/main/how.md#step-1) Create the ```base image```. In this case The OS - ```Debian Buster```.
 * [Step 2:](https://github.com/mlanca-c/ft_server/blob/main/how.md#step-2) Update the ```OS``` and install ```nginx```.

# Step 1

 ```vim
 # Syntax: FROM image:tag
 FROM debian:buster
 ```

 The ```FROM``` instruction sets the ```base image``` for the subsequent instructions. It creates an image on which you add layers, for then create the final image containing your app.

 > **Base Image:** 

# Step 2
