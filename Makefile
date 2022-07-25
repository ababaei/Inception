FILE = srcs/docker-compose.yml
WP_DATA = /home/ababaei/data/wp_data/
DB_DATA = /home/ababaei/data/db_data/

all: build
	sudo mkdir -p $(WP_DATA)
	sudo mkdir -p $(DB_DATA)

build:
	docker-compose -f $(FILE) build

up:
	docker-compose -f $(FILE) up -d

down:
	docker-compose -f $(FILE) down --volumes

rmvol:

clean: down
	docker container prune	

fclean: clean
	sudo rm -rf $(WP_DATA)
	sudo rm -rf $(DB_DATA)
	docker system prune -a

.PHONY: all build up down clean fclean
