all: hosts volumes fix up

fix:
	sudo apt -y purge "^virtualbox-.*"
	sudo apt -y autoremove
	sudo apt -y install docker-compose-plugin

hosts:
	@if ! grep "oburato.42.fr" /etc/hosts; then \
		sudo sed -i '2i\127.0.0.1\toburato.42.fr' /etc/hosts; \
	fi

volumes:
	@sudo mkdir -p /home/oburato/data/wordpress
	@sudo docker volume create --driver local --opt type=none --opt device=/home/oburato/data/wordpress --opt o=bind wordpress
	@sudo mkdir -p /home/oburato/data/mariadb
	@sudo docker volume create --driver local --opt type=none --opt device=/home/oburato/data/mariadb --opt o=bind mariadb
	@sudo mkdir -p /home/oburato/data/static
	@sudo docker volume create --driver local --opt type=none --opt device=/home/oburato/data/static --opt o=bind static

up:
	@docker compose -f ./srcs/docker-compose.yml up -d --build

down:
	@docker compose -f ./srcs/docker-compose.yml down

inspec:
	docker exec -it wordpress /bin/bash

clean:
	@docker volume rm mariadb
	@docker volume rm wordpress
	@docker volume rm static
	@sudo rm -rf /home/oburato/data/mariadb
	@sudo rm -rf /home/oburato/data/wordpress
	@sudo rm -rf /home/oburato/data/static

fclean: clean
	docker builder prune -f

re: down fclean all
