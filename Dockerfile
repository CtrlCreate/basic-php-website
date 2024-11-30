FROM ubuntu:18.04
ARG DEBIAN_FRONTEND=noninteractive
#RUN sed -i 's/http:\/\/archive.ubuntu.com\/ubuntu\//https:\/\/archive.ubuntu.com\/ubuntu\//g' /etc/apt/sources.list
RUN sed -i 's/http:\/\/archive.ubuntu.com\//http:\/\/us.archive.ubuntu.com\//g' /etc/apt/sources.list
RUN apt-get update -y && apt-get install -y apache2
RUN apt-get install -y php libapache2-mod-php
COPY 000-default.conf /etc/apache2/sites-available/000-default.conf
ADD . /var/www/html/
EXPOSE 80
ENTRYPOINT apachectl -D FOREGROUND



//mine

# Use the official Apache2 image as the base
FROM httpd:2.4

# Copy project files to the Apache2 web directory
COPY . /usr/local/apache2/htdocs/

# Expose port 80 to allow HTTP traffic
EXPOSE 80
