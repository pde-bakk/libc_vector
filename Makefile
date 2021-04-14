NAME = libc_vector.a
INCLUDE = -Iinclude -Iinclude_internal -Ilibft/include

SRC_DIR = ./srcs
FILES = vector utils
SRCS = $(addprefix $(SRC_DIR)/, $(addsuffix .c, $(FILES)))
OBJS = $(SRCS:.c=.o)

# COLORS
PINK = \x1b[35;01m
BLUE = \x1b[34;01m
YELLOW = \x1b[33;01m
GREEN = \x1b[32;01m
RED = \x1b[31;01m
WHITE = \x1b[31;37m
RESET = \x1b[0m

CFLAGS = -Wall -Werror -Wextra -pedantic
ifdef DEBUG
 CFLAGS += -g -fsanitize=address
else
 CFLAGS += -Ofast
endif
SHELL := /bin/bash
export SHELL

all: $(NAME)

$(NAME): $(OBJS) libft.a
	$(AR) -rc $(NAME) $(OBJS)
#	$(CC) $(CFLAGS) $(OBJS) $(SOLVER_OBJS) libft/libft.a $(INCLUDE) -o $@
	@printf "$(PINK)Done building libc_vector.a $(RESET)\n"

%.a: %
	make -C $<
	cp $</$@ $(NAME)

%.o: %.c
	$(CC) -c $(CFLAGS) $(INCLUDE) $^ -o $@

clean:
	/bin/rm -f $(OBJS) *.o *~ *.gch

fclean: clean
	make fclean -C libft
	/bin/rm -f $(NAME) libft.a libc_vector_test.out

re: fclean all

test: re
	$(CC) $(CFLAGS) $(INCLUDE) main.c $(NAME) -o libc_vector_test.out
	./libc_vector_test.out
