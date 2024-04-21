# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: gasouza <gasouza@student.42sp.org.br>      +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/04/21 10:06:55 by gasouza           #+#    #+#              #
#    Updated: 2024/04/21 10:44:05 by gasouza          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM debian:oldstable

RUN apt-get update && \ 
	apt-get install nginx openssl -y

EXPOSE 80

COPY ./conf/* ./etc/nginx/conf.d/
# COPY ./tools/ ./etc/nginx/tools


CMD ["nginx", "-g", "daemon off;"]
