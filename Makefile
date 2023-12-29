all		:
	if docker info | grep -q "not" || docker info | grep -q "ERROR"; then \
		echo "\033[0;96m--- Docker will be running soon ---"; \
		bash ./utils/init_docker.sh; \
		while docker info | grep -q "ERROR"; do \
			sleep 1; \
		done >/dev/null 2>&1; \
		docker-compose up --build; \
	else \
		echo "\033[0;96m--- Docker is already running ---"; \
		docker-compose up --build; \
	fi
	docker-compose up --build

down	: 
	docker-compose down

clean	:
	make down
	@docker system prune -af

fclean	:
	make clean
	@docker volume rm $$(docker volume ls -q -f dangling=true) || docker volume ls

re		:
	make fclean
	make all

.PHONY	: all down clean fclea re
