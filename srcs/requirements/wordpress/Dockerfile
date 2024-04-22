# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: gasouza <gasouza@student.42sp.org.br >     +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/04/21 10:14:16 by gasouza           #+#    #+#              #
#    Updated: 2024/04/22 06:28:03 by gasouza          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM debian:oldstable

# Install dependences
RUN apt update
RUN apt install -y curl php7.4 php7.4-fpm php7.4-mysqli mariadb-client

# Create folders
RUN mkdir -p /var/run/php
RUN mkdir /app

# Copy customized files
COPY ./conf/* /etc/php/7.4/fpm/pool.d/
COPY ./tools/* /app

# Install WP-CLI
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp

# # Install Wordpress
# ENV SITE_HOST="localhost"
# ENV SITE_NAME="Gasouza's Blog"
# ENV SITE_ADMIN_USER="gasouza"
# ENV SITE_ADMIN_PASS="pass"
# ENV SITE_ADMIN_MAIL="gasouza@42sp.org"

# ENV DB_HOST="mariadb"
# ENV DB_NAME="db-wp"
# ENV DB_USER="db-user"
# ENV DB_PASS="db-pass"

# RUN wp core download --path=/app --allow-root
# RUN wp config create --dbhost="${DB_HOST}" --dbname="${DB_NAME}" --dbuser="${DB_USER}" --dbpass="${DB_PASS}" --allow-root
# RUN wp db create --allow-root
# RUN wp core install --url="${SITE_HOST}}" --title="${SITE_ADMIN_PASS}" --admin_user="$SITE_ADMIN_USER" --admin_password="$SITE_ADMIN_PASS" --admin_email="$SITE_ADMIN_MAIL" --allow-root

# RUN chown -R www-data:www-data /app
# RUN chmod -R 774 /app

EXPOSE 9000

COPY ./tools/entry.sh /entry.sh

WORKDIR /app
ENTRYPOINT ["bash", "/entry.sh" ];

CMD ["/usr/sbin/php-fpm7.4", "-F"]
# CMD [ "bash" ]