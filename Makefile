
COMPOSE_FILE=./srcs/docker-compose.yml

all: config_host

config_host:
	@if ! grep "gasouza.42.fr" /etc/hosts > /dev/null; then \
		sudo sed -i '$$a 127.0.0.1\tgasouza.42.fr' /etc/hosts;\
	fi


up: config_host
	@docker compose -f $(COMPOSE_FILE) up --build

down:
	@docker compose -f $(COMPOSE_FILE) down

clean:
	@docker volume rm app-files db-files

re: down clean up