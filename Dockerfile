# pecifiying image for Docker to pull
FROM	debian:buster

#Exposing ports that may be used
EXPOSE 80 443

#Setting ENVIRENEMENT VARIABLE [export DEBIAN_FRONTEND=noninteractive]
ENV		DEBIAN_FRONTEND noninteractive

#Auto selection for mysql-5.7
RUN		echo "mysql-apt-config mysql-apt-config/select-server select mysql-5.7" | debconf-set-selections

#install user needs on server
RUN		apt-get update &&\
		apt-get -y upgrade &&\
		apt-get -y install apt-utils vim nginx php7.3 php7.3-fpm wget lsb-release gnupg php-mysql 

#install mysql-server --version 5.7
RUN 	wget https://dev.mysql.com/get/mysql-apt-config_0.8.14-1_all.deb \
		&& dpkg -i mysql-apt-config_0.8.14-1_all.deb \
		&& apt-get update

RUN		apt-get -y install mysql-server

#install phpmyadmin
RUN		apt install -y php-mbstring  \
		&& wget https://files.phpmyadmin.net/phpMyAdmin/4.9.2/phpMyAdmin-4.9.2-all-languages.tar.gz \
		&& tar xvf phpMyAdmin-4.9.2-all-languages.tar.gz \
		&& mv phpMyAdmin-4.9.2-all-languages/ /var/www/html/phpmyadmin

COPY	start.sh	. 

CMD		sh start.sh
