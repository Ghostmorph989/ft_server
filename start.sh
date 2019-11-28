#!/bin/bash

service php7.3-fpm start && /etc/init.d/mysql start && service nginx start
exec /bin/bash
