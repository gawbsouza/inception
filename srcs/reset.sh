docker compose down
docker container rm -f $(docker ps -aq)
docker volume rm app-files db-files
# docker compose up --build