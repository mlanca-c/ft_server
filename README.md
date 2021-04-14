# ft_server
  42Cursus-ft_server/42Lisboa

# Contents
 <details>

 1. [Intro](https://github.com/mlanca-c/ft_server#Intro)
	* [Keywords](https://github.com/mlanca-c/ft_server#Keywords)
 2. [Web Server](https://github.com/mlanca-c/ft_server#Web-Server)
 3. [Docker](https://github.com/mlanca-c/ft_server#Docker)
    * [Containers](https://github.com/mlanca-c/ft_server#Containers)
    * [Docker Architecture](https://github.com/mlanca-c/ft_server#Docker-Architecture)
    * [Docker Commands](https://github.com/mlanca-c/ft_server#Docker-Commands)
    * [Dockerfile](https://github.com/mlanca-c/ft_server#Dockerfile)
 4. [Debian Buster](https://github.com/mlanca-c/ft_server#Debian-Buster)

 </details>
 
# Intro
 > [subject](subject.pdf)

 This is a System Administration subject. You will discover Docker and you will set up your first ```web server```.

 Objectives:
 * Using ```Docker```, set up a ```web server``` with ```Nginx``` on ```Debian Buster```.
 * Run several services at the same time: ```WordPress``` website, ```phpMyAdmin```, and ```MySQL```.
 * Apply ```SSL``` protocol.
 * Apply ```autoindex```.

 -----------------------

 * **Operative System:** Debian Buster 
 * **Web Server:** Nginx
 * **Running Apps:** WordPress, phpMyAdmin, MySQL
 * **Protocol:** SSL

 -----------------------

## Keywords
 > [Docker](https://docs.docker.com/get-started/overview/), [Web Server](https://developer.mozilla.org/en-US/docs/Learn/Common_questions/What_is_a_web_server), [Dockerfile](https://docs.docker.com/engine/reference/builder/), [Debian Buster](https://www.debian.org/doc/), [Nginx](https://nginx.org/en/docs/), [SSL Protocol](https://www.csoonline.com/article/3246212/what-is-ssl-tls-and-how-this-encryption-protocol-works.html), [WordPress](https://codex.wordpress.org/Main_Page), [phpMyAdmin](https://www.phpmyadmin.net/docs/), [MySQL](https://dev.mysql.com/doc/), [autoindex]().

 In the contents below I try to explain what are these keywords, and how they fit in this project. If you had no difficulties understanding these keywords with their links, then I suggest you to waste your time somewhere else, and not to read below this.

# Web Server
 <details>

 >  ```Web Server``` is computer software and underlying hardware that accepts requests via ```HTTP``` (Hypertext Transfer Protocol), the network protocol created to distribute web pages, or its secure variant ```HTTPS``` (Hypertext Transfer Protocol Secure).

 To fetch a webpage, your browser sends a request to the web server, which searches for the requested file in its own ```storage space```. Upon finding the file, the server reads it, processes it as-needed, and sends it to the browser.

 ![web_server](http://www.clipartbest.com/cliparts/9c4/LnM/9c4LnMzgi.png)
 
 As its name implies, ```HTTP``` specifies how to transfer hypertext (linked web documents) between two computers.
 * Only clients can make HTTP requests, and then only to servers. Servers can only respond to a client's HTTP request.
 * When requesting a file via HTTP, clients must provide the file's URL.
 * The web server must answer every HTTP request, at least with an error message.

 **On a web server, the HTTP server is responsible for processing and answering incoming requests.**

 For this project, our Web server will be Nginx, which is a HTTP server.

 </details>

# Docker
 ![dockerimage](https://www.docker.com/sites/default/files/social/docker_facebook_share.png) 
 > [Dockerdocs](https://docs.docker.com/get-started/overview/)

 * Containerizes ```Applications```.
 * Runs each service with its own dependencies in separate ```containers```.

## Containers
 Containers are completely isolated environments, as in they can have their own services, their own network interfaces, just like ```virtual machines```, with the exception that they all share the same OS ```kernel```. 

 Containers have existed for years. What ```Docker``` offers is tools with several powerful functionalities, that make it easier for developers to be able to work with containers.

 -----------------------
 > An ```operating system``` (OS) is system software that manages computer hardware and software resources and provides common services for computer programs. Nearly every computer program requires an operating system to function. The two most common operating systems are ```Microsoft Windows``` and ```Apple's macOS```.

 An OS consists of two things, an OS ```kernel``` and a set of ```software```.

 The OS ```kernel``` is responsible for interacting with the underlying hardware. While the OS kernel remains the same being, for example Linux, it's the ```software``` above it that makes these OS different. This software may consist of a different user interface, drivers, compilers, file managers, developer tools, etc.

 So you have a common Linux ```kernel``` shared across all races, and some custom ```software``` that differentiates OS from each other.

 -----------------------
 **Docker containers share the underlying kernel**. So let's say we have a system with an ```Ubuntu``` OS with docker installed on it, docker can run any flavor of OS on top of it as long as they are all based on the same ```kernel```, in this case ```Linux```. So Docker can run on another distribution like ```Debian```, ```Fedora```, ```SUSE```. Each docker container only has the additional software that makes these OS different.

 The main purpose of Docker is to package and containerize applications, and to ship them and run them as many times as you want.

 > A container only lives so long as the process inside it's alive.

### Containers vs. VM

 <details>

 |Virtual Machines	|Containers		|
 |:----------------:|:-------------:|
 |Designed by running software on top of physical servers to emulate a particular hardware system. A hypervisor, or a virtual machine monitor, is software, firmware, or hardware that creates and runs VMs. It’s what sits between the hardware and the virtual machine and is necessary to virtualize the server. Within each virtual machine runs a unique guest operating system. VMs with different operating systems can run on the same physical server — a UNIX VM can sit alongside a Linux VM, and so on. Each VM has its own binaries, libraries, and applications that it services, and the VM may be many gigabytes in size. Virtual machines and containers differ in several ways, but the primary difference is that containers provide a way to virtualize an OS so that multiple workloads can run on a single OS instance. With VMs, the hardware is being virtualized to run multiple OS instances. Containers’ speed, agility, and portability make them yet another tool to help streamline software development.|Containers sit on top of a physical server and its host OS — for example, Linux or Windows. Each container shares the host OS kernel and, usually, the binaries and libraries, too. Shared components are read-only. Containers are thus exceptionally “light”—they are only megabytes in size and take just seconds to start, versus gigabytes and minutes for a VM.|

 ![image2](https://s7280.pcdn.co/wp-content/uploads/2018/08/containers-vs-virtual-machines-1024x522.png)

 </details>

## Docker Architecture
 Docker uses a client-server architecture. The client talks to the ```docker daemon```, which does the heavy lifting of building, running and distributing your ```docker container```.
 The client and the daemon can run on the same system, or you can connect a docker client to a remote docker daemon.
 They communicate using ```REST API```, over UNIX sockets on a network interface.
 ![image1](https://docs.docker.com/engine/images/architecture.svg)
### Docker Daemon

 <details>

 The Docker Daemon ```(dockerd)``` listens for docker API requests and manages docker objects such as ```images```, ```containers```, ```networks```, and ```volumes```.
 A daemon can also communicate with other daemons to manage Docker services.

 </details>

### Docker Client

 <details>

 The Docker Client ```(docker)``` is the primary way that many docker users interact with docker.
 When you use commands such as ```docker run```, the client sends these commands to dockerd, which caries them out.
 The docker comand uses the Docker API.

 </details>

### Docker Registries

 <details>

 A Docker registry stores Docker images. Docker Hub is a public registry that anyone can use, and Docker is configured to look for images on Docker Hub by default. You can even run your own private registry.
 When you use the ```docker pull``` or ```docker run``` commands, the required images are pulled from your configured registry. When you use ```docker push``` command, your image is pushed to your configured registry.

 </details>

### Docker Objects

 <details>

 When you use Docker, you are creating and using images, containers, networks, volumes, plugins, and other objects. This section is a brief overview of some of those objects.
 |Objects		|Description|
 |:------------:|:---------:|
 |Images		|An image is a read-only template with instructions for creating a Docker container. You might create your own images or you might only use those created by others and published in a ```registry```. To build your own image, you create a ```Dockerfile``` with a simple syntax for defining the steps needed to create the ```image``` and run it. Each instruction in a Dockerfile creates a layer in the image.|
 |Containers	|A container is a runnable instance of an ```image```. You can create, start, stop, move, or delete a container using the Docker API or CLI. You can connect a container to one or more networks, attach storage to it, or even create a new ```image``` based on its current state. A container is defined by its image as well as any configuration options you provide to it when you create or start it.|

 > An ```image``` is a package or a template. It s used to create one or more ```containers```, **containers are running instances of images** that are isolates and have theis own environments and set of processes.

 </details>

## Docker Commands
 ```
 # docker run command is used to run a contaier from an image. 
 # Using default tag: latest as in <image:version> if you want another version 
 # to run.
 $ docker run <image>		
 
 # docker ps command lists all running containers and some basic information 
 # about them, such as the container ID, the name of the image used to run the 
 # containers, the current status and the names of the container.
 $ docker ps

 CONTAINER ID	IMAGE	COMMAND				CREATED		STATUS		PORTS	NAMES
 79685ac413d	nginx	"nginx -g 'daemon of..."	7 seconds ago	Up 6 seconds	80/tcp	silly_sammet
 
 # the -a option outputs all running as well as previously stopped or exited 
 # containers.
 $ docker ps -a	

 # docker stop command is used to stop a running contaier. 
 # You must provide either the container ID or the container name.
 $ docker stop <container name>

 # docker rm command used to remove a stopped or exited container permanently.
 $ docker rm <container name/container ID>

 # docker images command shows a list of images and their sizes.
 $ docker images

 # docker rm command used to remove an image permanently.
 # First stop and delete all containers running of that image to remove it.
 $ docker rm <image>	

 # docker pull command pulls the image from docker hub.
 $ docker pull <image>

 # docker exec command
 $ docker exec <container name> <command>	

 ```

 Port Mapping:
 

## Dockerfile

 Traditionally, a docker file is called ```Dockerfile``` and located in the root of the context. You use the -f flag with docker build to point to a Dockerfile anywhere in your file system.

### $ docker build

 <details>

 The docker build command builds an image from a ```Dockerfile``` and a context. The build’s context is the set of files at a specified location ```PATH``` or ```URL```. The ```PATH``` is a directory on your local filesystem. The ```URL``` is a Git repository location.
 ```
 $ docker build .
 
 Sending build context to Docker daemon 6.51 MB
 ...
 ```
 This example shows a build command that uses the current directory as context. The building is run by the Docker daemon, not by the CLI. The first thing a build process does is send the entire context (recursively) to the daemon. In most cases, it’s best to start with an empty directory as context and keep your Dockerfile in that directory. Add only the files needed for building the Dockerfile. 

 The Docker daemon runs the instructions in the Dockerfile one-by-one, committing the result of each instruction to a new image if necessary, before finally outputting the ID of your new image. The Docker daemon will automatically clean up the context you sent.

 </details>

### Format of a Dockerfile

 <details>
 
 ```
 # Comment
 INSTRUCTION arguments
 ```
 The instruction is not case-sensitive. However, convention is for them to be UPPERCASE to distinguish them from arguments more easily.

 Docker runs instructions in a Dockerfile in order. A Dockerfile must begin with a ```FROM``` instruction.The FROM instruction specifies the ```Parent Image``` from which you are building. FROM may only be preceded by one or more ```ARG``` instructions, which declare arguments that are used in ```FROM``` lines in the Dockerfile.

 > Parent Image: An image’s parent image is the image designated in the ```FROM``` directive in the image’s Dockerfile. All subsequent commands are based on this parent image. A Dockerfile with the ```FROM scratch``` directive uses no parent image, and creates a base image.

 > ARG: The ARG instruction defines a variable that users can pass at build-time to the builder with the ```docker build``` command using the ```--build-arg <varname>=<value>``` flag. A Dockerfile may include one or more ARG instructions.

 </details>

 -----------------------

 **How I installed Docker on Ubuntu:** [convenience script](https://docs.docker.com/engine/install/ubuntu/#install-using-the-convenience-script)

 -----------------------

# Nginx

 Nginx is an open source ```web server```, that can also function as a ```proxy``` server for email (IMAP, POP3, and SMTP) and a ```reverse proxy``` and load balancer for HTTP, TCP, and UDP servers.

 -----------------------

 > [Proxy](https://airtame.com/blog/what-is-proxy/): gateway between you and the internet. It separates users from websites, secures data and betters network performance.

 -----------------------

 You can create an Nginx instance in a Docker container using the NGINX Open Source image from the Docker Hub.

 docker pull will pull nginx image from docker hub.
 ```Vim
 $ docker pull nginx
 ```

 Checking to see if pull was succesfull
 ```Vim
 $ docker images

 REPOSITORY   TAG       IMAGE ID       CREATED        SIZE
 nginx        latest    62d49f9bab67   16 hours ago   133MB
 ```

 Run a command in a new container. The docker run command first creates a writeable container layer over the specified image - in this case Nginx - and then starts it using the specified command.
 ```Vim
 $ docker run nginx
 ```

 Then if I open a new tab, while docker run command is still running I can see that the container is still running as well.
 ```Vim
 $ docker ps

 CONTAINER ID   IMAGE     COMMAND                  CREATED          STATUS          PORTS     NAMES
 21d35338e000   nginx     "/docker-entrypoint.…"   17 seconds ago   Up 16 seconds   80/tcp    agitated_edison
 ```

 After stopping the run command on the first tab (ctrl + c) the container is inactive. To check if there are any containers open, use docker ps.
 ```Vim
 $ docker ps


 ```
 
 To see closed containers, use docker ps -a
 ```Vim
 docker ps -a

 CONTAINER ID   IMAGE     COMMAND                  CREATED          STATUS                     PORTS     NAMES
 21d35338e000   nginx     "/docker-entrypoint.…"   10 minutes ago   Exited (0) 9 minutes ago             agitated_edison

 ```

# Debian Buster
 You can install Docker Engine in different ways, depending on your needs:
 * Most users set up Docker’s repositories and install from them, for ease of installation and upgrade tasks. This is the recommended approach, except for Raspbian.
 * Some users download the DEB package and install it manually and manage upgrades completely manually. This is useful in situations such as installing Docker on air-gapped systems with no access to the internet.
 * In testing and development environments, some users choose to use automated convenience scripts to install Docker. This is currently the only approach for Raspbian.

