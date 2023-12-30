# default rule
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

.PHONY	: all down clean fclean re
