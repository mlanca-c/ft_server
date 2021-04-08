# ft_server
  42Cursus-ft_server/42Lisboa

# Contents
 <details>
  <Contents>Click to expand</Contents>
	
1. [Intro](https://github.com/mlanca-c/ft_server#Intro)
	* [Keywords](https://github.com/mlanca-c/ft_server#Keywords)
2. [Web Server](https://github.com/mlanca-c/ft_server#Web-Server)
2. [Docker](https://github.com/mlanca-c/ft_server#Docker)
    * [Containers](https://github.com/mlanca-c/ft_server#Containers)
    * [Docker Architecture](https://github.com/mlanca-c/ft_server#Docker-Architecture)
    * [Docker Commands](https://github.com/mlanca-c/ft_server#Docker-Commands)
    * [Dockerfile](https://github.com/mlanca-c/ft_server#Dockerfile)
3. [Debian Buster](https://github.com/mlanca-c/ft_server#Debian-Buster)
	* [Set up repositoriy](https://github.com/mlanca-c/ft_server#Set-up-repositoriy)
</details>
 
# Intro
 > [subject](subject.pdf)

This is a System Administration subject. You will discover Docker and you will set up your first web server.
 Objectives:
 * Using ```Docker```, set up a ```web server``` with ```Nginx``` on ```Deiban Buster```.
 * Run several services at the same time: ```WordPress``` website, ```phpMyAdmin```, and ```MySQL```.
 * Apply ```SSL``` protocol.
 * Apply ```autoindex```.

## Keywords
 > [Docker](https://docs.docker.com/get-started/overview/), [Web Server](https://developer.mozilla.org/en-US/docs/Learn/Common_questions/What_is_a_web_server), [Dockerfile](https://docs.docker.com/engine/reference/builder/), [Debian Buster](https://www.debian.org/doc/),[Nginx](https://nginx.org/en/docs/), [SSL Protocol](https://www.csoonline.com/article/3246212/what-is-ssl-tls-and-how-this-encryption-protocol-works.html), [WordPress](https://codex.wordpress.org/Main_Page), [phpMyAdmin](https://www.phpmyadmin.net/docs/), [MySQL](https://dev.mysql.com/doc/), [autoindex]().

 In the contents below I try to explain what are these keywords, and how they fit in this project. If you had no difficulties understanding these keywords with their links, then I suggest you to waste your time somewhere else, and not to read below this.

# Debian Buster
 You can install Docker Engine in different ways, depending on your needs:
 * Most users set up Docker’s repositories and install from them, for ease of installation and upgrade tasks. This is the recommended approach, except for Raspbian.
 * Some users download the DEB package and install it manually and manage upgrades completely manually. This is useful in situations such as installing Docker on air-gapped systems with no access to the internet.
 * In testing and development environments, some users choose to use automated convenience scripts to install Docker. This is currently the only approach for Raspbian.



## How I installed Docker on Ubuntu
 [Install using the convenience script](https://docs.docker.com/engine/install/ubuntu/#install-using-the-convenience-script)
 
 
