# Base image
FROM default-route-openshift-image-registry.apps.ext2.mtp.local/registry/httpd-24:$(results.image-tag.path)

# Set the working directory
WORKDIR /var/www/html

# Copy your custom HTML file
#COPY index.html /var/www/html/index.html

# Expose HTTP port
EXPOSE 8080

# Start Apache HTTP server in the foreground
CMD ["scl", "enable", "httpd24", "--", "httpd", "-D", "FOREGROUND"]
