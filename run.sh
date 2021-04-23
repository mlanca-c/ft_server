docker build -t image .
docker run -it --rm --name container -itp 80:80 -p 443:443 image
