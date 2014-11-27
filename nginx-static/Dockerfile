FROM ubuntu:14.10
MAINTAINER Patrik Falk "patrik@swehacker.com"
ENV REFRESHED_AT 2014-06-01

RUN apt-get update
RUN apt-get install -y -q nginx

#RUN mkdir -p /var/www/html/website
#RUN chown -R www-data /var/www/html/

RUN echo "NGINX is up and running!" > /usr/share/nginx/html/index.html

ADD nginx/global.conf /etc/nginx/conf.d/
ADD nginx/nginx.conf /etc/nginx/nginx.conf

EXPOSE 80
#ENTRYPOINT ["/usr/sbin/nginx"]
