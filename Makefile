all		:
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

LINK_FILES	:=	Dockerfile.frontend \
				.dockerignore \
				init_react.sh
link:
	$(foreach file, $(LINK_FILES), ln frontend/$(file) ../frontend/;)

.PHONY	: all down clean fclea re
