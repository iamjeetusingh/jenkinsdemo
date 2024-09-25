# Pull the latest Ubuntu image
FROM ubuntu:latest

# Install necessary packages (Nginx)
RUN apt-get update && apt-get install -y nginx

# Copy the index.html file to the default Nginx location
COPY index.html /var/www/html/

# Expose port 8000
EXPOSE 8000

# Start Nginx and make it listen on port 8000
RUN sed -i 's/listen 80;/listen 8000;/' /etc/nginx/sites-available/default

# Start the Nginx service in the foreground
CMD ["nginx", "-g", "daemon off;"]
