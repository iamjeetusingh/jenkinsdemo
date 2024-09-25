# Pull the latest Ubuntu image
FROM ubuntu:latest

# Install necessary packages (Nginx)
RUN apt-get update 
RUN apt-get install apache2

# Copy the index.html file to the default Nginx location
COPY index.html /var/www/html/

# Expose port 8000
EXPOSE 8000

# Change apache2 to listen on port 8000
RUN sed -i 's/Listen 80/Listen 8000/' /etc/apache2/ports.conf
RUN sed -i 's/:80/:8000/' /etc/apache2/sites-available/000-default.conf

# Start apache2 in the foreground (keep container running)
CMD ["apachectl", "-D", "FOREGROUND"]
