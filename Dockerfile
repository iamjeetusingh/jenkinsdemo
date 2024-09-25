# adding base image
FROM ubuntu:22.04

# copying the web app inside the container
COPY index.html /var/www/html/

