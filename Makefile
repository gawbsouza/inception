# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: user42 <user42@student.42.fr>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/04/26 19:35:30 by gasouza           #+#    #+#              #
#    Updated: 2024/04/26 22:09:31 by user42           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

USER_BASE		= gasouza
DOMAIN_BASE		= $(USER_BASE).42.fr

VOLUMES_PATH	= /home/$(USER_BASE)

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
	@if ! grep "$(DOMAIN_BASE)" /etc/hosts > /dev/null; then \
		sudo sed -i '$$a 127.0.0.1\t$(DOMAIN_BASE)' /etc/hosts;\
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