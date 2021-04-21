# Steps of project

 * [Step 1:](https://github.com/mlanca-c/ft_server/blob/main/how.md#step-1) Create the ```base image```. In this case The OS - ```Debian Buster```.
 * [Step 2:](https://github.com/mlanca-c/ft_server/blob/main/how.md#step-2) Update the ```OS``` and install ```nginx```.

# Step 1
 
 Installing ```Debian Buster``` as the ```base image```, through the Dockerfile.

 > **Base Image:** is the basic image on which you add layers, and create your final image containing your app.

 The ```FROM``` instruction initializes a new build stage and sets the ```Base Image``` for subsequent instructions. As such, a valid ```Dockerfile``` must start with a FROM instruction. The image can be any valid image – it is especially easy to start by pulling an image from the Public Repositories.

 ```FROM [--platform=<platform>] <image>[:<tag>] [AS <name>]```

 ```vim
 FROM debian:buster
 ```

# Step 2

 The ```RUN``` instruction will execute any commands in a new layer on top of the current image and commit the results. The resulting committed image will be used for the next step in the ```Dockerfile```.

 ```RUN <command>```

 The ```COPY``` instruction copies new files or directories from ```<src>``` and adds them to the filesystem of the container at the path ```<dest>```.
	* The <src> path must be inside the context of the build; you cannot COPY ../something /something, because the first step of a docker build is to send the context directory (and subdirectories) to the docker daemon.
	* If <src> is a directory, the entire contents of the directory are copied, including filesystem metadata.
	* If <src> is any other kind of file, it is copied individually along with its metadata. In this case, if <dest> ends with a trailing slash /, it will be considered a directory and the contents of <src> will be written at <dest>/base(<src>).
	* If multiple <src> resources are specified, either directly or due to the use of a wildcard, then <dest> must be a directory, and it must end with a slash /.
	* If <dest> does not end with a trailing slash, it will be considered a regular file and the contents of <src> will be written at <dest>.
	* If <dest> doesn’t exist, it is created along with all missing directories in its path.

 ```
 COPY [--chown=<user>:<group>] <src>... <dest>
 COPY [--chown=<user>:<group>] ["<src>",... "<dest>"]
 ```

 The ```EXPOSE``` instruction informs Docker that the container listens on the specified network ports at runtime. You can specify whether the port listens on TCP or UDP, and the default is TCP if the protocol is not specified.

 The ```EXPOSE``` instruction does not actually publish the port. It functions as a type of documentation between the person who builds the image and the person who runs the container, about which ports are intended to be published. To actually publish the port when running the container, use the -p flag on docker run to publish and map one or more ports, or the -P flag to publish all exposed ports and map them to high-order ports.

 ```EXPOSE <port> [<port>/<protocol>...]```


 The main purpose of a ```CMD``` is to provide defaults for an executing container. These defaults can include an executable, or they can omit the executable, in which case you must specify an ENTRYPOINT instruction as well.

 ```CMD ["executable","param1","param2"]```

# Docker build

 This is how I could see what the Dockerfile was doing through every instruction.

 The ```docker build``` command builds Docker images from a Dockerfile and a “context”. A build’s context is the set of files located in the specified ```PATH``` or ```URL```.
 The build process can refer to any of the files in the context. 
 For example, your build can use a ````COPY```` instruction to reference a file in the context.

 ```
 $ docker build [OPTIONS] PATH | URL | -
 $ docker build -t image .
 ```


