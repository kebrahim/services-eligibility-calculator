# Use DockerLAMP image: https://hub.docker.com/r/mattrayner/lamp
FROM mattrayner/lamp:latest

# Install package dependencies
RUN apt-get update
RUN apt-get -y install libapache2-mod-php7.4
RUN apt-get -y install php7.4-mysql
RUN apt-get -y install php7.4-ldap
RUN apt-get -y install php7.4-intl

# Install vendor dependencies
WORKDIR /api
ADD . /api
RUN composer install

# Use custom create_mysql_users.sh to also create services schema
WORKDIR /
ADD ./create_mysql_users.sh /create_mysql_users.sh
RUN chmod +x /create_mysql_users.sh

# Startup server
ADD ./supervisord-boulderapi.conf /etc/supervisor/conf.d/supervisord-boulderapi.conf
CMD [ "/run.sh" ]
