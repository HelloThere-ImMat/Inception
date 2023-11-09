SHELL=/bin/bash

## FOLDERS ##

SRCS				+= srcs/
REQ_DIR 			+= $(SRCS)/requirements/

MARIADB_DIR			= $(REQ_DIR)/mariadb/
NGINX_DIR			= $(REQ_DIR)/nginx/
TOOLS_DIR			= $(REQ_DIR)/tools/
WORDPRESS_DIR		= $(REQ_DIR)/wordpress/

## IMAGES ##

RM_IMG 				:= if [ "$$(docker images -q)" ]; then docker rmi $$(docker images -q) -f; fi
RM_VOL 				:= if [ "$$(docker volume ls -q)" ]; then docker volume rm $$(docker volume ls -q); fi
RM_ALL 				:= docker system prune -af

all:
	cd $(SRCS); docker-compose build
	cd $(SRCS); docker-compose up

stop:
	cd $(SRCS); docker-compose down

clean: clean_volume
	cd $(NGINX_FOLDER); $(RM_IMG)

clean_volume: stop
	sudo rm -rf ~/data/wordpress/* ~/data/mariadb/*
	cd $(NGINX_FOLDER); $(RM_VOL)



fclean: clean
	cd $(NGINX_FOLDER); $(RM_ALL)

re: fclean
	$(MAKE)

.SILENT:
.PHONY:
