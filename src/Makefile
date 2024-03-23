all:
	@echo "User one of the follow commands:";
	@echo "\tmake pull"
	@echo "\tmake build"
	@echo "\tmake up"
	@echo "\tmake down"
	@echo "\tmake clean"
	@echo "\tmake fclean"
	@echo "\tmake logs"

pull:
	docker compose -f srcs/docker-compose.yml pull
build:
	docker compose -f srcs/docker-compose.yml build
up: create_vols_dirs
	docker compose -f srcs/docker-compose.yml up -d
down:
	docker compose -f srcs/docker-compose.yml down
logs:
	docker compose -f srcs/docker-compose.yml logs -f
clean: down
	docker compose -f srcs/docker-compose.yml rm
clean_vols:
	docker volume rm wordpress mariadb uptime-kuma || true
create_vols_dirs:
	mkdir -p ~/data/wordpress/
	mkdir -p ~/data/mariadb/
	mkdir -p ~/data/uptime-kuma/
fclean: clean clean_vols
