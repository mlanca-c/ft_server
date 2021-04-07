# ft_server
  42Cursus-ft_server/42Lisboa

# Contents
1. [Intro](https://github.com/mlanca-c/ft_server#Intro)
	* [Keywords](https://github.com/mlanca-c/ft_server#Keywords)
2. [Docker](https://github.com/mlanca-c/ft_server#Docker)
    * [Docker Architecture](https://github.com/mlanca-c/ft_server#Docker-Architecture)
# Intro
 > [subject](subject.pdf)

This is a System Administration subject. You will discover Docker and you will set up your first web server.
 Objectives:
 * Using ```Docker```, set up a web server with ```Nginx``` on ```Deiban Buster```.
 * Run several services at the same time: ```WordPress``` website, ```phpMyAdmin```, and ```MySQL```.
 * Apply ```SSL``` protocol.
 * Apply ```autoindex```.
## Keywords
 > [Docker](https://docs.docker.com/get-started/overview/), [Web Server?](https://developer.mozilla.org/en-US/docs/Learn/Common_questions/What_is_a_web_server), [Dockerfile](https://docs.docker.com/engine/reference/builder/), Operative System: [Debian Buster](https://www.debian.org/doc/), HTTP server: [Nginx](https://nginx.org/en/docs/), [SSL Protocol](https://www.csoonline.com/article/3246212/what-is-ssl-tls-and-how-this-encryption-protocol-works.html), [WordPress](https://codex.wordpress.org/Main_Page), [phpMyAdmin](https://www.phpmyadmin.net/docs/), [MySQL](https://dev.mysql.com/doc/), [autoindex]()

# Docker
 * [Dockerdocs](https://docs.docker.com/get-started/overview/)
## Docker Architecture
 Docker uses a client-server architecture. The client talks to the ```docker daemon```, which does the heavy lifting of building, running and distributing your ```docker conatiner```.
 The client and the daemon can run on the same system, or you can connecr a docker client to a remote docker daemon.
 They communicate using ```REST API```, over UNIX sockets on a network interface.
 ![image1](https://docs.docker.com/engine/images/architecture.svg)
### Docker Daemon
 The Docker Daemon ```(dockerd)``` listens for docker API requests and manages docker objects such as ```images```, ```containers```, ```networks```, and ```volumes```.
 A daemon can also communicate with other daemons to manage Docker services.

### Docker Client
 The Docker Client ```(docker)``` is the primary way that many docker users interact with docker.
 When you use commands such as ```docker run```, the client sends these commands to dockerd, which caries them out.
 The docker comand uses the Docker API.

### Docker Registries
 A Docker registry stores Docker images. Docker Hub is a public registry that anyone can use, and Docker is configured to look for images on Docke Hub by default. You can even run your own private registry.
 When you use the ```docker pull``` or ```docker run``` commands, the required images are pulled from your configured registry. When you use ```docker push``` command, your image is pushed to your configured registry.

### Docker Objects
 When you use Docker, you are creating and using images, containers, networks, volumes, plugins, and other objects. This section is a brief overview of some of those objects.
 |Objects		|Description|
 |:------------:|:---------:|
 |Images		|An image is a read-only template with instructions for creating a Docker container. You might create your own images or you might only use those created by others and published in a registry. To build your own image, you create a Dockerfile with a simple syntax for defining the steps needed to create the image and run it. Each instruction in a Dockerfile creates a layer in the image.|
 |Containers	|A container is a runnable instance of an image. You can create, start, stop, move, or delete a container using the Docker API or CLI. You can connect a container to one or more networks, attach storage to it, or even create a new image based on its current state. A container is defined by its image as well as any configuration options you provide to it when you create or start it.|

