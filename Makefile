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
CFLAGS += -pedantic -O3 -march=native
#CFLAGS += -flto
#CFLAGS += -g -fsanitize=address -fno-omit-frame-pointer
#CFLAGS += 
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
_RED=\x1b[31m
_GREEN=\x1b[32m
_YELLOW=\x1b[33m
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
	@echo "$(_YELLOW)Object files deleted.$(_END)"

norme: clean
	norminette -R CheckForbiddenSourceHeader $(SRC)
	norminette -R CheckForbiddenSourceHeader $(INC_DIR)/libft.h

fclean: clean
	@rm -f $(NAME)
	@echo "$(_YELLOW)$(NAME) deleted.$(_END)"

re:
	@$(MAKE) fclean
	@$(MAKE) all

.PHONY: all clean fclean re
.PRECIOUS: src.mk author
