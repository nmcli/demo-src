# Base image
FROM default-route-openshift-image-registry.apps.ext2.mtp.local/registry/httpd-24:latest

# 사용자 정의 설정 적용
COPY custom-httpd.conf /etc/httpd/conf/httpd.conf

# Set the working directory
WORKDIR /var/www/html

# 파일을 복사
COPY src/main/resources/static/index.html /var/www/html/index.html
COPY target/classes/static/index.html /var/www/html/index.html

# Expose HTTP port
EXPOSE 8080

# 빌드 중 파일이 존재하는지 확인
RUN ls -lh /var/www/html

# SSL 설정 파일 삭제 (HTTPS 비활성화)
RUN rm -f /usr/local/apache2/conf/extra/httpd-ssl.conf \
    && rm -f /etc/httpd/conf.d/ssl.conf

# 기본 HTTPD 실행
CMD ["httpd", "-D", "FOREGROUND"]
