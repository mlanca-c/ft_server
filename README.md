# ft_server
 42Cursus-ft_server/42Lisboa

# Contents

 1. [Intro](https://github.com/mlanca-c/ft_server#intro)
 2. [My First Web Server](https://github.com/mlanca-c/ft_server#my-first-web-server)
 	* [Operating System](https://github.com/mlanca-c/ft_server#operating-system)
	* [Web Server](https://github.com/mlanca-c/ft_server#web-server)
	* [Database Server](https://github.com/mlanca-c/ft_server#database-server)
	* [Headless CMS](https://github.com/mlanca-c/ft_server#headless-cms)
 3. [Docker](https://github.com/mlanca-c/ft_server#docker)
 4. [Dockerfile](https://github.com/mlanca-c/ft_server#dockerfile)

# Intro

 This is a System Administration subject. You will discover Docker and you will setup your first web server.
 
 Objectives:
 * Using ```Docker```, set up a ```web server``` with ```Nginx``` on ```Debian Buster```.
 * Run several services at the same time: ```WordPress``` website, ```PhpMyAdmin```, and ```MySQL```.
 * Apply ```SSL``` protocol.
 * Apply ```autoindex```.

## Keywords

 > [Docker](https://docs.docker.com/get-started/overview/), [Web Server](https://developer.mozilla.org/en-US/docs/Learn/Common_questions/What_is_a_web_server), [Dockerfile](https://docs.docker.com/engine/reference/builder/), [Debian Buster](https://www.debian.org/doc/), [Nginx](https://nginx.org/en/docs/), [SSL Protocol](https://www.csoonline.com/article/3246212/what-is-ssl-tls-and-how-this-encryption-protocol-works.html), [WordPress](https://codex.wordpress.org/Main_Page), [phpMyAdmin](https://www.phpmyadmin.net/docs/), [MySQL](https://dev.mysql.com/doc/).

# My First Web Server 

 * **Operating System:** Debian Buster
 * **Web Server:** Nginx
 * **Database Server:** MariaDB/MySQL
 * **Server-Side Scripting Language:** PHP

 Plus I will install and configure **WordPress** and **PhpMyAdmin**.

 ```PHP```, is responsible for generating dynamic web pages.

 Static vs. Dynamic Web Pages:
 * **Static:** one that is usually written in plain HTML and what is in the code of the page is what is displayed to the user.
 * **Dynamic:** one that is written using a server=side scripting language such as PHP, ASP, JSP, etc.

 In ft_server we will create a ```dynamic web server```.

## Operating System

 An Operating System is a software that manages computer hasrdware,  software resources, and provides common services for computer programs.
 * examples: windows, MacOS, Ubuntu, Debian, etc.

 **Kernel:** is a computer program at the core of a computer OS that has complete control over everything in the system.
 * examples: Linux kernel, etc.

### Debian Buster

 Debian is a OS, with a Linux kernel.

 * Buster: is the development codename for ```debian 10```. It is the curret stable distribution of Debian.

## Web Server

 A web server is hardware or software through which a computer can host a website.
 A server can be hosted in ```kernel mode``` or in ```user mode```.
 * **Kernel mode:** web server runs on top of a OS.
 * **User mode:** slower and less efective.

### Nginx

 Nginx is a open source web server written in C. It serves web content, and can act as a proxy.

## Database Server

 A database server is a computer system that provides other computers with services related to accessing and retrieving data from a database.

 Accessing a database can happen via frontend, running locally via a user's machine (e.g. phpMyAdmin).
 * **MySQL:** Open source relational database management system.
 * **MariaDB:** community developed commercially supported fork of the MySQL.

### PhpMyAdmin

 PhpMyAdmin is a free software for MySQL and MariaDB. It'a a portable web application written primarily in PHP.
 It has become one of the most popular MySQL administration tools, especially for web hosting services.

## Headless CMS

 A headless CMS is a backend only content management system that acts primarily as a content repository.
 It makes content accessible via an API for display on any device, without a built-in frontend or a presentation layer.

### WordPress

 WordPress is an open source content management system. As its core, WordPress is the simplest, most popular way to create your own website or blog.

 > [WordPress with PhpMyAdmin](https://wordpress.org/support/article/creating-database-for-wordpress/#using-phpmyadminA)

# Docker

 ![](https://www.docker.com/sites/default/files/social/docker_facebook_share.png)

 > [Dockerdocs](https://docs.docker.com/get-started/overview/)

 * Containerizes applications;
 * Runs each service with its owns dependencies in separate ```containers```.
 * Replaces ```Virtual Machines```.

## Containers

 Containers are completely isolated environments, as in they can have their own services, their own network interfaces, just like ```virtual machines```, with the exception that they all share the same OS

 Containers have existed for years. What ```Docker``` offers is tools with several powerful functionalities, that make it easier for developers to be able to work with containers.

 -----------------------
 > An ```operating system``` (OS) is system software that manages computer hardware and software resources and provides common services for computer programs. Nearly every computer program requires an oper

 An OS consists of two things, an OS ```kernel``` and a set of ```software```.

 The OS ```kernel``` is responsible for interacting with the underlying hardware. While the OS kernel remains the same being, for example Linux, it's the ```software``` above it that makes these OS differe

 So you have a common Linux ```kernel``` shared across all races, and some custom ```software``` that differentiates OS from each other.

 -----------------------
 **Docker containers share the underlying kernel**. So let's say we have a system with an ```Ubuntu``` OS with docker installed on it, docker can run any flavor of OS on top of it as long as they are all b

 The main purpose of Docker is to package and containerize applications, and to ship them and run them as many times as you want.

 > A container only lives so long as the process inside it's alive.

### Containers vs. VM

 <details>

 |Virtual Machines  |Containers     |
 |:----------------:|:-------------:|
 |Designed by running software on top of physical servers to emulate a particular hardware system. A hypervisor, or a virtual machine monitor, is software, firmware, or hardware that creates and runs VMs.

 ![](https://s7280.pcdn.co/wp-content/uploads/2018/08/containers-vs-virtual-machines-1024x522.png)

 </details>

### Docker Objects

 <details>

 When you use Docker, you are creating and using images, containers, networks, volumes, plugins, and other objects. This section is a brief overview of some of those objects.
 |Objects       |Description|
 |:------------:|:---------:|
 |Images        |An image is a read-only template with instructions for creating a Docker container. You might create your own images or you might only use those created by others and published in a ```reg
 |Containers    |A container is a runnable instance of an ```image```. You can create, start, stop, move, or delete a container using the Docker API or CLI. You can connect a container to one or more netwo

 > An ```image``` is a package or a template. It s used to create one or more ```containers```, **containers are running instances of images** that are isolates and have theis own environments and set of p

 </details>

# Dockerfile

 Docker can build images automatically by reading the instructions from a ```Dockerfile```. 
 A Dockerfile is a text document that contains all the commands a user could call on the command line to assemble an image. 
 Using ```docker build``` users can create an automated build that executes several command-line instructions in succession.

 > **docker build:** the docker build command builds Docker images from a Dockerfile and a “context”. A build’s context is the set of files located in the specified PATH or URL. The build process can refer to any of the files in the context. For example, your build can use a COPY instruction to reference a file in the context.

 ```Shell
 $ docker build -t <name of the docker image>:<tag> <path of the Dockerfile>
 ```

 In this work, I will use the instruction:
 ```Shell
 $ docker build image .
 ```

## Dockerfile Instructions

 The Dockerfile I created for this project has the following instructions:

<details>

### FROM

 ```Dockerfile
 FROM <image>[:<tag>]
 ```

 The ```FROM``` instruction initializes a new build stage and sets the ```Base Image``` for subsequent instructions. 

### RUN

 ```Dockerfile
 RUN <command> 
 ```

 The ```RUN``` instruction will execute any commands in a new layer on top of the current image and commit the results. The resulting committed image will be used for the next step in the Dockerfile.

### COPY
 
 ```Dockerfile
 COPY [--chown=<user>:<group>] <src>... <dest>
 ```

 The ```COPY``` instruction copies new files or directories from <src> and adds them to the filesystem of the container at the path <dest>.

### EXPOSE

 ```Dockerfile
 EXPOSE <port> [<port>/<protocol>...]
 ```

 The ```EXPOSE``` instruction informs Docker that the container listens on the specified network ports at runtime.
 You can specify whether the port listens on TCP or UDP, and the default is TCP if the protocol is not specified.

### CMD

 ```Dockerfile
 CMD <command>
 ```

There can only be one ```CMD``` instruction in a Dockerfile. 
If you list more than one CMD then only the last CMD will take effect.
The main purpose of a CMD is to provide defaults for an executing container.
These defaults can include an executable, or they can omit the executable, in which case you must specify an ENTRYPOINT instruction as well.

</details>

# LEMP stack on debian buster
