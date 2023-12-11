# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: laprieur <laprieur@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/12/05 16:29:19 by laprieur          #+#    #+#              #
#    Updated: 2023/12/05 19:22:19 by laprieur         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# **************************************************************************** #
#                                    PATHS                                     #
# **************************************************************************** #

YML_PATH	:= srcs/docker-compose.yml
DATA_PATH	:= /home/laprieur/data

# **************************************************************************** #
#                                   RECIPES                                    #
# **************************************************************************** #

all: header build

build:
	docker-compose -f $(YML_PATH) up --build

stop:
	docker-compose -f $(YML_PATH) stop

start:
	docker-compose -f $(YML_PATH) start

restart: clean build

clean:
	docker-compose -f $(YML_PATH) down -v

fclean: clean
	sudo rm -rf $(DATA_PATH)/*/*
	docker system prune -af

# **************************************************************************** #
#                                    STYLE                                     #
# **************************************************************************** #

GREEN			:= \033[0;32m
YELLOW			:= \033[0;33m
BLUE			:= \033[0;34m
CYAN			:= \033[0;36m
OFF				:= \033[m

header:
	@printf "%b" "$(GREEN)"
	@echo "	___                      _   _						"
	@echo "       |_ _|____   ___ ___ ____ | |_(_) ___  ____	"
	@echo "	| ||  _ \ / __/ _ \  _ \| __| |/ _ \|  _ \			"
	@echo "	| || | | | (_|  __/ |_) | |_| | (_) | | | |			"
	@echo "       |___|_| |_|\___\___|  __/ \__|_|\___/|_| |_|	"
	@echo "			  |_|by laprieur           					"
	@echo
	@printf "%b" "$(CYAN)Compose path:	$(YELLOW)$(YML_PATH)\n"
	@printf "%b" "$(CYAN)Data path:	$(YELLOW)$(DATA_PATH)\n"
	@printf "%b" "$(OFF)"
	@echo
