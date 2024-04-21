# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: gasouza <gasouza@student.42sp.org.br >     +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/04/21 10:06:55 by gasouza           #+#    #+#              #
#    Updated: 2024/04/21 15:56:18 by gasouza          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM debian:oldstable

# Install dependences
RUN apt update
RUN apt -y install nginx openssl


# Copy customized files
COPY ./conf/nginx.conf /etc/nginx/conf.d/

RUN mkdir -p /etc/security/certs/
COPY ./tools/entry.sh .

EXPOSE 443

ENTRYPOINT ["bash", "./entry.sh" ];

CMD ["nginx", "-g", "daemon off;"]

# CMD ["/etc/security/install-cert.sh && nginx -g daemon off"]
# CMD ["nginx", "-g", "daemon off;"]
