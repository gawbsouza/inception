# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: gasouza <gasouza@student.42sp.org.br>      +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/04/21 10:06:55 by gasouza           #+#    #+#              #
#    Updated: 2024/04/26 21:15:17 by gasouza          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM debian:oldstable

RUN apt update && apt -y install nginx openssl

COPY ./conf/nginx.conf /etc/nginx/conf.d/
COPY ./tools/entry.sh .

RUN mkdir -p /app/security/certs

EXPOSE 443

ENTRYPOINT ["bash", "./entry.sh" ];

CMD ["nginx", "-g", "daemon off;"]