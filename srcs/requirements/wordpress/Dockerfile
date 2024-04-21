# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: gasouza <gasouza@student.42sp.org.br >     +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/04/21 10:14:16 by gasouza           #+#    #+#              #
#    Updated: 2024/04/21 14:37:23 by gasouza          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM debian:oldstable

# Install dependences
RUN apt update
RUN apt install -y php7.4 php7.4-fpm php7.4-mysqli

# Create folders
RUN mkdir -p /var/run/php
RUN mkdir /app

# Copy customized files
COPY ./conf/* /etc/php/7.4/fpm/pool.d/
COPY ./tools/* /app

# RUN chown -R www-data:www-data /app
# RUN chmod -R 774 /app

EXPOSE 9000

CMD ["/usr/sbin/php-fpm7.4", "-F"]