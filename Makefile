-include srcs/.env

up:
	@mkdir -p ${HOME}/data/wordpress
	@mkdir -p ${HOME}/data/mariadb
	@docker compose -f srcs/docker-compose.yml up --detach --build
	@#open http://${LOGIN}.42.ch
	@#xinit /absolute/path/to/firefox

down:
	@docker compose -f srcs/docker-compose.yml down -v --remove-orphans

rm:
	@docker compose -f srcs/docker-compose.yml down -v --remove-orphans --rmi all
	@docker system prune -af
	@docker volume prune -f
	@rm -rf ${HOME}/data/wordpress
	@rm -rf ${HOME}/data/mariadb

re: down
	@rm -rf ${HOME}/data/wordpress
	@rm -rf ${HOME}/data/mariadb
	@mkdir -p ${HOME}/data/wordpress
	@mkdir -p ${HOME}/data/mariadb
	@docker compose -f srcs/docker-compose.yml up --detach --build

rre: rm up