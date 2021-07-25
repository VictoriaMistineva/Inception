SRCS = ./srcs/

all: fclean prepare run

run: 
	@ cd $(SRCS) &&  docker-compose up --build ; 

prepare:
	@ cd $(SRCS)/requirements/tools && sudo sh prepare.sh

fclean:
	@ cd $(SRCS) && docker-compose down && docker system prune;
	@ sudo rm -Rf ~/data/;

.PHONY: fclean prepare run all 