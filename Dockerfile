# Base image
FROM default-route-openshift-image-registry.apps.ext2.mtp.local/registry/httpd-24:latest

# Set the working directory
WORKDIR /var/www/html

# Spring Boot 빌드 후 정적 파일을 복사
COPY target/classes/static/index.html /var/www/html/index.html

# Expose HTTP port
EXPOSE 8080

# SSL 설정 파일 삭제 (HTTPS 비활성화)
RUN rm -f /usr/local/apache2/conf/extra/httpd-ssl.conf \
    && rm -f /etc/httpd/conf.d/ssl.conf

# 기본 HTTPD 실행
CMD ["httpd", "-D", "FOREGROUND"]
