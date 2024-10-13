# Pull the latest Ubuntu image
FROM ubuntu:latest

# Install necessary packages (apache2)
RUN apt-get update -y
RUN apt-get install -y apache2 && apt-get install -y apache2-utils
RUN apt-get clean

# Copy the index.html file to the default apache2 location
COPY index.html /var/www/html/

# Expose port 5000
EXPOSE 5000

# Change apache2 to listen on port 5000
RUN sed -i 's/Listen 80/Listen 5000/' /etc/apache2/ports.conf
RUN sed -i 's/:80/:5000/' /etc/apache2/sites-available/000-default.conf

# Starting apache service
RUN service apache2 start

# Start apache2 in the foreground (keep container running)
CMD ["apachectl", "-D", "FOREGROUND"]
# ENTRYPOINT service apache2 start && bash
