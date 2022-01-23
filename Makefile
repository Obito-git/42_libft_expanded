NAME = libft.a
CC = gcc
CFLAGS = -Wall -Werror -Wextra

FILE_NBR=1

#colors:
RED="\e[31m"
GREEN="\e[32m"
YELLOW="\e[33m"
ENDCOLOR="\e[0m"

#src directions
MEM_DIR = mem/
STR_DIR = string/
CHR_DIR = char/
LST_DIR = lists/
PRINT_DIR = print/
UTIL_DIR = utils/
PRINTF_DIR = $(PRINT_DIR)ft_printf/
GNL_DIR = $(UTIL_DIR)gnl/

SRCS = $(CHR_DIR)ft_isalnum.c $(CHR_DIR)ft_isalpha.c $(CHR_DIR)ft_isascii.c $(CHR_DIR)ft_isspace.c \
$(CHR_DIR)ft_isdigit.c $(CHR_DIR)ft_isprint.c $(CHR_DIR)ft_tolower.c $(CHR_DIR)ft_toupper.c \
$(MEM_DIR)ft_bzero.c $(MEM_DIR)ft_calloc.c $(MEM_DIR)ft_memchr.c $(MEM_DIR)ft_memcmp.c \
$(MEM_DIR)ft_memcpy.c $(MEM_DIR)ft_memmove.c $(MEM_DIR)ft_memset.c \
$(PRINT_DIR)ft_putchar_fd.c $(PRINT_DIR)ft_putendl_fd.c $(PRINT_DIR)ft_putnbr_fd.c $(PRINT_DIR)ft_putstr_fd.c \
$(PRINT_DIR)ft_putchar.c $(PRINT_DIR)ft_putendl.c $(PRINT_DIR)ft_putnbr.c $(PRINT_DIR)ft_putstr.c $(PRINT_DIR)ft_putnbr_base.c \
$(STR_DIR)ft_split.c $(STR_DIR)ft_strdup.c $(STR_DIR)ft_strjoin.c $(STR_DIR)ft_strlcpy.c $(STR_DIR)ft_strmapi.c \
$(STR_DIR)ft_strnstr.c $(STR_DIR)ft_strtrim.c $(STR_DIR)ft_strchr.c $(STR_DIR)ft_striteri.c $(STR_DIR)ft_strlcat.c \
$(STR_DIR)ft_strlen.c $(STR_DIR)ft_strncmp.c $(STR_DIR)ft_strrchr.c $(STR_DIR)ft_substr.c \
$(STR_DIR)ft_strcpy.c $(STR_DIR)ft_strcat.c $(STR_DIR)ft_strcpy.c $(STR_DIR)ft_strrev.c \
$(UTIL_DIR)ft_atoi.c $(UTIL_DIR)ft_itoa.c $(UTIL_DIR)ft_convert_base.c $(UTIL_DIR)ft_numblen.c \
$(GNL_DIR)get_next_line.c $(GNL_DIR)get_next_line_utils.c \
$(PRINTF_DIR)ft_printf.c $(PRINTF_DIR)parsing.c $(PRINTF_DIR)patterns.c \
$(LST_DIR)ft_lstadd_back.c $(LST_DIR)ft_lstadd_front.c $(LST_DIR)ft_lstclear.c $(LST_DIR)ft_lstdelone.c \
$(LST_DIR)ft_lstiter.c $(LST_DIR)ft_lstlast.c $(LST_DIR)ft_lstmap.c $(LST_DIR)ft_lstnew.c $(LST_DIR)ft_lstsize.c

OBJS = $(SRCS:.c=.o)

all: $(NAME)
	
%.o: %.c
	@$(CC) $(CFLAGS) -c -o $@ $<

$(NAME): git check $(OBJS)
	@echo ${GREEN}"Objects have been created!"${ENDCOLOR}
	@echo ""
	@ar rc $(NAME) $(OBJS)
	@ranlib $(NAME)
	@echo ${YELLOW}$(NAME)" is ready for use!"${ENDCOLOR}

check: generate_difs
	@echo ${YELLOW}"Looking for makefile and src diffs..."${ENDCOLOR}
	@sleep 1
	@$(eval DIF := $(shell diff -y make_src real_src | grep ">" | sed 's/^[^[:alnum:]]*//'))
	@rm -f make_src && rm -f real_src
	@if [ ! -z "$(DIF)" ]; then\
		echo "Functions are not added in Makefile:";\
		echo ${RED}"$(DIF)"${ENDCOLOR};\
		exit 1;\
	else\
		echo ${GREEN}"OK"${ENDCOLOR};\
	fi
	@sleep 1

generate_difs:
	@rm -f make_src && rm -f real_src
	@echo "$(SRCS)" | tr ' ' '\n' | sort > make_src
	@find -name "*.c" | sed 's/^..//g' | sort > real_src

git:
	@echo ""
	@echo ${YELLOW}"Git:"${GREEN}
	@sleep 1
	@git pull
	@echo ${ENDCOLOR}
	@echo ""

clean:
	@rm -f $(OBJS)
	@rm -f .*.swp
	@rm -f */.*.swp
	@rm -f *.so
	@rm -f */*.so
	@rm -f a.out
	@rm -f */a.out
	@rm -f main.c
	@rm -f */main.c
	@rm -f make_src && rm -f real_src
	@echo ""
	@echo ${GREEN}"Objects and debris were successfully removed"${RESET}

fclean: clean
	@rm -f $(NAME)
	@echo ""
	@echo ${YELLOW}"Project is clear!"${ENDCOLOR}

re: fclean all

.PHONY: all clean fclean re bonus

