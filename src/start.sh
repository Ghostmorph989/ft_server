# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    start.sh                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: malaoui <marvin@42.fr>                     +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2019/11/29 12:05:40 by malaoui           #+#    #+#              #
#    Updated: 2019/11/29 14:36:13 by malaoui          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#!/bin/bash

#starting services

service php7.3-fpm start &&\
chown -R mysql:mysql /var/lib/mysql\
&& service mysql start && service nginx start

mysql --user=root -e "source /var/www/html/phpmyadmin/sql/create_tables.sql"
mysql --user=root -e "source /var/www/html/phpmyadmin/privileges.sql"

exec /bin/bash
