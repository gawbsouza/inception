# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: gasouza <gasouza@student.42sp.org.br >     +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/04/21 10:06:55 by gasouza           #+#    #+#              #
#    Updated: 2024/04/21 14:44:01 by gasouza          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM debian:oldstable

# Install dependences
RUN apt update
RUN apt -y install nginx openssl


# Copy customized files
COPY ./conf/* ./etc/nginx/conf.d/
# COPY ./tools/ ./etc/nginx/tools

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
