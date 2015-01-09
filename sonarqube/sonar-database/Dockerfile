from ubuntu:14.10

# Because docker replaces /sbin/init: https://github.com/dotcloud/docker/issues/1024 
RUN dpkg-divert --local --rename --add /sbin/initctl
RUN apt-get update && apt-get upgrade -y

ADD create_database.sql /tmp/create_database.sql

RUN apt-get install -y mysql-server
RUN sed -i -e"s/^bind-address\s*=\s*127.0.0.1/bind-address = 0.0.0.0/" /etc/mysql/my.cnf

RUN /usr/bin/mysqld_safe & \
    sleep 10s && \
	mysql -u root < /tmp/create_database.sql

VOLUME ["/var/lib/mysql", "/var/log/mysql"]

CMD ["mysqld_safe"]
