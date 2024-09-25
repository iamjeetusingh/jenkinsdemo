# Fetching the image
FROM centos:7
	 
# Setting up the working dir
WORKDIR /app
	 
# Running the command
RUN yum install -y httpd
	 
# Copying content to required directory
COPY . /var/www/html/
	 
# Allowing port 80
EXPOSE 80
	 
#running the HTTPD command
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
