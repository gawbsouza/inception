# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: gasouza <gasouza@student.42sp.org.br >     +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/04/26 19:35:30 by gasouza           #+#    #+#              #
#    Updated: 2024/04/27 11:17:56 by gasouza          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

USER_NAME		= gasouza
DOMAIN_NAME		= $(USER_NAME).42.fr

VOLUMES_PATH	= /home/$(USER_NAME)

APP_VOLUME_NAME = app-files
DB_VOLUME_NAME	= db-files

APP_VOLUME_PATH	= $(VOLUMES_PATH)/data/$(APP_VOLUME_NAME)
DB_VOLUME_PATH	= $(VOLUMES_PATH)/data/$(DB_VOLUME_NAME)

COMPOSE_FILE	= ./srcs/docker-compose.yml

all: config_host create_volumes up

up: config_host
	@docker compose -f $(COMPOSE_FILE) up --build

down:
	@docker compose -f $(COMPOSE_FILE) down

config_host:
	@if ! grep "$(DOMAIN_NAME)" /etc/hosts > /dev/null; then \
		sudo sed -i '$$a 127.0.0.1\t$(DOMAIN_NAME)' /etc/hosts;\
	fi

create_volumes:
	@sudo mkdir -p $(APP_VOLUME_PATH)
	@sudo mkdir -p $(DB_VOLUME_PATH)
	@sudo docker volume create --opt type=none --opt device=$(APP_VOLUME_PATH) --opt o=bind $(APP_VOLUME_NAME)
	@sudo docker volume create --opt type=none --opt device=$(DB_VOLUME_PATH) --opt o=bind $(DB_VOLUME_NAME)

remove_docker_volumes:
	@docker volume rm $(APP_VOLUME_NAME) $(DB_VOLUME_NAME)

remove_local_volumes:
	@sudo rm -rf $(VOLUMES_PATH)

clean: down

fclean: clean remove_docker_volumes remove_local_volumes

re: fclean all