docker compose down
docker rm  -f $(docker ps -aq)
docker rmi -f $(docker image ls -q)
docker volume rm app-files db-files
# docker compose up --build