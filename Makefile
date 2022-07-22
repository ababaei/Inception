FILE = docker-compose.yml

all: build
	sudo mkdir -p /home/ababaei/data/wp_data/
	sudo mkdir -p /home/ababaei/data/db_data/

build:
	docker-compose -f docker-compose.yml build

up:
	docker-compose -f docker-compose.yml up -d

down:
	docker-compose down --volumes

rmvol:

clean: down
	docker container prune	

fclean: clean
	sudo rm -rf /home/ababaei/data/wp_data/
	sudo rm -rf /home/ababaei/data/db_data/
	docker system prune -a

.PHONY: all build up down clean fclean
