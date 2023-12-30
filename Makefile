
FRONT_DOCKER_FILES	:=	Dockerfile.frontend \
						.dockerignore \
						init_react.sh

#BACK_DOCKER_FILES	:=	Dockerfile.backend \

#레포의 루트에 도커파일 연결
link:
	$(foreach file, $(FRONT_DOCKER_FILES), ln frontend/$(file) ../frontend/;)
#	$(foreach file, $(BACK_DOCKER_FILES), ln backend/$(file) ../backend/;)


# default rule

all		:
	make link
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
