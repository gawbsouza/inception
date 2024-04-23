# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: gasouza <gasouza@student.42sp.org.br >     +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/04/21 10:14:16 by gasouza           #+#    #+#              #
#    Updated: 2024/04/23 08:54:24 by gasouza          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM debian:oldstable


RUN apt update && \
apt install -y curl php7.4 php7.4-fpm php7.4-mysqli mariadb-client

WORKDIR /app

COPY ./conf/www.conf /etc/php/7.4/fpm/pool.d/
COPY ./tools/entry.sh /entry.sh

RUN mkdir -p /var/run/php

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
    chmod +x wp-cli.phar && \
    mv wp-cli.phar /usr/local/bin/wp

EXPOSE 9000

ENTRYPOINT ["bash", "/entry.sh" ];
CMD ["/usr/sbin/php-fpm7.4", "-F"]