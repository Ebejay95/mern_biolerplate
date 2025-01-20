#------------------------------------------------------------------------------#
#--------------                       PRINT                       -------------#
#------------------------------------------------------------------------------#

BLACK := \033[90m
RED := \033[31m
GREEN := \033[32m
YELLOW := \033[33m
BLUE := \033[34m
MAGENTA := \033[35m
CYAN := \033[36m
X := \033[0m

SUCCESS := \n\
████████████████████████████████████████████████████████████████████████████████\n\
$(X)\n\
$(GREEN)██   ██  ███████  ███████  ██    █$(X)\n\
$(GREEN)█ █ █ █  █        █     █  █ █   █$(X)\n\
$(GREEN)█  █  █  ███████  ███████  █  █  █$(X)\n\
$(GREEN)█     █  █        █   █    █   █ █$(X)\n\
$(GREEN)█     █  ███████  █    ██  █    ██$(X)\n\
$(X)\n\
████████████████████████████████████████████████████████████████████████████████\n\

#------------------------------------------------------------------------------#
#--------------                      GENERAL                      -------------#
#------------------------------------------------------------------------------#

CONTAINER=mern

#------------------------------------------------------------------------------#
#--------------                       RULES                       -------------#
#------------------------------------------------------------------------------#

.PHONY: all clean fclean re

all:
	@npm install
	@npm run start


container-build:
	@if ! docker ps | grep -q $(CONTAINER); then \
		echo "$(YELLOW)Building the container environment$(X)"; \
		docker compose -f ./docker-compose.yml build --no-cache; \
	else \
		echo "$(YELLOW)Container already built.. skip build process$(X)"; \
	fi

container-up:
	@if ! docker ps | grep -q $(CONTAINER); then \
		echo "$(YELLOW)Starting the container environment$(X)"; \
		docker compose -p $(CONTAINER) -f ./docker-compose.yml up -d; \
	else \
		echo "$(YELLOW)Container already running.. skip its creation$(X)"; \
	fi

container:
	@make container-build
	@make container-up
	@docker exec -it $(CONTAINER) bash

prune:
	@if docker ps -a | grep -q $(NAME); then \
		echo "$(RED)Removing existing container...$(X)"; \
		docker stop $(NAME) && docker rm $(NAME); \
	else \
		echo "$(YELLOW)No container named '$(NAME)' to remove.$(X)"; \
	fi
	@echo "$(GREEN)All done!$(X)"