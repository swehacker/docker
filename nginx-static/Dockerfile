FROM ubuntu:14.10
MAINTAINER Patrik Falk "patrik@swehacker.com"
RUN apt-get update
RUN apt-get install -y -q nginx
#ADD nginx/global.conf /etc/nginx/conf.d/
ADD nginx/nginx.conf /etc/nginx/nginx.conf
#RUN echo "NGINX is up and running!" > /usr/share/nginx/html/website/index.html
#ADD html/ /usr/share/nginx/html/
EXPOSE 80
ENTRYPOINT ["/usr/sbin/nginx"]
CMD ["-g", "daemon off;"]
