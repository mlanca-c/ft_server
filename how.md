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
