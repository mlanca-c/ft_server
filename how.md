# Steps of project

 * [Step 1:](https://github.com/mlanca-c/ft_server/blob/main/how.md#step-1) Create the ```base image```. In this case The OS - ```Debian Buster```.
 * [Step 2:](https://github.com/mlanca-c/ft_server/blob/main/how.md#step-2) Update the ```OS``` and install ```nginx```.

# Step 1
 
 Installing ```Debian Buster``` as the ```base image```, through the Dockerfile.

 The ```FROM``` instruction sets the ```base image``` for the subsequent instructions.

 > **Base Image:** is the basic image on which you add layers, and create your final image containing your app.

 **Syntax:** FROM image:tag

 ```vim
 FROM debian:buster
 ```

# Step 2
