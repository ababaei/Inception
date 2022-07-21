FILE = docker-compose.yml

build:
	docker-compose -f docker-compose.yml build

up:
	docker-compose -f docker-compose.yml up -d

down:
	docker-compose down --volumes

rmvol:
	sudo rm -rf /home/ababaei/data/db-data/*
	sudo rm -rf /home/ababaei/data/wp-data/*

