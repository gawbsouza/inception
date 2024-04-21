# inception

### General rules

- A Docker container that contains NGINX with TLSv1.2 or TLSv1.3 only.   
- A Docker container that contains WordPress + php-fpm (it must be installed and configured) only without nginx.   
- A Docker container that contains MariaDB only without nginx.
- A volume that contains your WordPress database.
- A second volume that contains your WordPress website files.
- A docker-network that establishes the connection between your containers.
Your containers have to restart in case of a crash   

> Read about PID 1 and the best practices for writing Dockerfiles.

### Wordpress
In your WordPress database, there must be two users, one of them being the administrator. The administrator’s username can’t contain admin/Admin or administrator/Administrator (e.g., admin, administrator, Administrator, admin-123, and so forth).   
Your volumes will be available in the /home/login/data folder of the host machine using Docker. Of course, you have to replace the login with yours.


# Configuração PHP-fpm
https://www.digitalocean.com/community/tutorials/php-fpm-nginx
- Crir usuário e grupo
```bash
groupadd phpuser
useradd -g phpuser phpuser

# arquivo de configuração /etc/php/7.<v>/fpm/pool.dy
# reiniciar o servico após a confinuração: service php7.4-fpm restart
```