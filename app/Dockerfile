# Use the official httpd image as the base image
FROM httpd:2.4

# Set the working directory inside the container
WORKDIR /usr/local/apache2/htdocs/

# Copy the application files from the app/src directory to the container's web server directory
COPY src/ /usr/local/apache2/htdocs/

EXPOSE 80