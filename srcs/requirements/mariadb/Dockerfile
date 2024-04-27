# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: gasouza <gasouza@student.42sp.org.br>      +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/04/21 20:26:55 by gasouza           #+#    #+#              #
#    Updated: 2024/04/27 21:40:14 by gasouza          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM debian:oldstable

RUN apt update && apt install -y mariadb-server
 
COPY ./conf/mariadb.cnf /etc/mysql/mariadb.conf.d/
COPY ./tools/entry.sh /entry.sh

RUN mkdir -p /var/lib/mysql /var/run/mysqld
RUN chmod 644 /etc/mysql/mariadb.conf.d/mariadb.cnf
RUN chmod 777 /var/run/mysqld
RUN chown -R mysql:mysql /var/lib/mysql /var/run/mysqld

EXPOSE 3306

ENTRYPOINT ["bash", "/entry.sh" ]

CMD ["mysqld_safe"]