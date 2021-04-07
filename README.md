# ft_server
  42Cursus-ft_server/42Lisboa

## Contents
1. [Intro](https://github.com/mlanca-c/ft_server#Intro)
2. [Docker](https://github.com/mlanca-c/ft_server#Docker)
    * [Docker Architecture](https://github.com/mlanca-c/ft_server#Docker-Architecture)
# Intro
 This is a System Administration subject. You will discover Docker and you will set up your first web server.
 Objectives:
 * Using Docker, set up a web server with Nginx on Deiban Buster.
 * Run several services at the same time: WordPress website, phpMyAdmin, and MySQL.
 * Apply SSL protocol.
 * Apply autoindex.

> [Operative System: Debian Buster](https://www.debian.org/doc/)
system software that manages computer hardware, software resources, and provides common services for computer programs (ex: Linux, Windows, etc).

> [HTTP server: Nginx](https://nginx.org/en/docs/)

> [what is a web server?](https://developer.mozilla.org/en-US/docs/Learn/Common_questions/What_is_a_web_server)

> [subject](subject.pdf)

# Docker
 * [Dockerdocs](https://docs.docker.com/get-started/overview/)
## Docker Architecture
 Docker uses a client-server architecture. The client talks to the ```docker daemon```, which does the heavy lifting of building, running and distributing your ```docker conatiner```.
 The client and the daemon can run on the same system, or you can connecr a docker client to a remote docker daemon.
 They communicate using ```REST API```, over UNIX sockets on a network interface.

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
