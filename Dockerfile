FROM bootcampgroup3/digi
MAINTAINER JZ

ADD files/etc/yum.repos.d/nginx.repo /etc/yum.repos.d/nginx.repo
RUN yum install -y nginx

ADD files/etc/nginx/conf.d/default.conf /etc/nginx/conf.d/default.conf
ADD files/etc/nginx/nginx.conf /etc/nginx/nginx.conf
ADD files/usr/share/nginx/html /usr/share/nginx/html

ADD files/etc/nginx/ssl /etc/nginx/ssl
ADD files/etc/nginx/ssl/nginx.crt /etc/nginx/ssl/nginx.crt
ADD files/etc/nginx/ssl/nginx.key /etc/nginx/ssl/nginx.key

VOLUME ["/var/log/nginx"]

EXPOSE 8080 443


ENTRYPOINT ["/usr/sbin/nginx", "-c", "/etc/nginx/nginx.conf"]
