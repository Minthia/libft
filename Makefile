# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: dde-jesu <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2018/11/30 10:00:57 by dde-jesu          #+#    #+#              #
#    Updated: 2018/12/14 16:51:05 by hdo-minh         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME = libft.a

#DIRECTORY
SRC_DIR = src
OBJ_DIR = ./obj
INC_DIR = includes

#COMPILATION
CC = clang
CFLAGS = -Wall -Wextra -Werror -Iinclude
#CFLAGS += -O3 -march=native -pipe -flto -pedantic -fsanitize=address -std=99
PRECOMPILE = @mkdir -p $(dir $@)
POSTCOMPILE =

#FILES.c .o .h
include src.mk

OBJ = $(patsubst $(SRC_DIR)/%.c,$(OBJ_DIR)/%.o,$(SRC))
INC = $(INC_DIR)/libft.h

# PROGRESS BAR
T = $(words $(OBJ))
N = 0
C = $(words $N)$(eval N := x $N)
ECHO = "[`expr $C  '*' 100 / $T`%]"

#COLORS
_GREY=\x1b[30m
_RED=\x1b[31m
_GREEN=\x1b[32m
_YELLOW=\x1b[33m
_BLUE=\x1b[34m
_WHITE=\x1b[37m
_END=\x1b[0m

all:
	@$(MAKE) $(NAME)

$(OBJ_DIR)/%.o: $(SRC_DIR)/%.c
	@$(PRECOMPILE)
	@$(CC) $(CFLAGS) -c -o $@ $<
	@printf "%-60b\r" "$(ECHO) $(_RED) Compiling... $(_END)"
	@$(POSTCOMPILE)

$(NAME): $(OBJ) $(INC)
	@ar rcs $(NAME) $(OBJ)

clean:
	@rm -rf $(OBJ_DIR)

fclean: clean
	@rm -f $(NAME)

re:
	@$(MAKE) fclean
	@$(MAKE) all

.PHONY: all clean fclean re
.PRECIOUS: src.mk author
