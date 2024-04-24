# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: gasouza <gasouza@student.42sp.org.br >     +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/04/21 20:26:55 by gasouza           #+#    #+#              #
#    Updated: 2024/04/24 08:35:47 by gasouza          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM debian:oldstable


RUN apt update && \
    apt install -y mariadb-server

EXPOSE 3306

# COPY ./conf/mariadb.conf /etc/mysql/mariadb.conf.d/

RUN mkdir -p /var/lib/mysql /var/run/mysqld
RUN chown -R mysql:mysql /var/lib/mysql /var/run/mysqld
RUN chmod 777 /var/run/mysqld

COPY ./conf/mariadb.cnf /etc/mysql/mariadb.conf.d/
RUN chmod 644 /etc/mysql/mariadb.conf.d/mariadb.cnf

COPY ./tools/setup-db.sh /setup-db.sh

# RUN chmod +x /usr/local/bin/setup-db.sh
# RUN bash /setup-db.sh

# CMD [ "bash" ]
ENTRYPOINT ["bash", "/setup-db.sh" ];
CMD ["mysqld_safe"]