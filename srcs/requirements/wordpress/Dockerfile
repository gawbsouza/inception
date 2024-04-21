# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: gasouza <gasouza@student.42sp.org.br>      +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/04/21 10:14:16 by gasouza           #+#    #+#              #
#    Updated: 2024/04/21 11:03:27 by gasouza          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM debian:oldstable

RUN apt update && \
    apt install php7.4 php7.4-fpm php-fpm php7.4-mysqli wget -y

RUN mkdir -p /var/run/php && chmod 777 /var/run/php

COPY ./conf/* /etc/php/7.4/fpm/pool.d/
COPY ./tools/* /var/www/html

RUN chown -R www-data:www-data /var/www/html
RUN chmod -R 774 /var/www/html

EXPOSE 9000

CMD ["/usr/sbin/php-fpm7.4", "-F"]