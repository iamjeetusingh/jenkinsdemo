# Fetching the image
FROM centos:7
	 
# Running the command
RUN yum install httpd
	 
# Copying content to required directory
COPY . /var/www/html/
	 
# Allowing port 8000
EXPOSE 8000
	 
#running the HTTPD command
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
