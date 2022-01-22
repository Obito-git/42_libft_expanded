#изменить инклуды файлов, протестить на тестере. добавить норминетку. добавить принтф и гнл и функции из пуш свапа

NAME = libft.a
CC = gcc
CFLAGS = -Wall -Werror -Wextra
MEM_DIR = mem/
STR_DIR = string/
CHR_DIR = char/
LST_DIR = lists/
PRINT_DIR = print/
UTIL_DIR = utils/
SRCS = $(CHR_DIR)ft_isalnum.c $(CHR_DIR)ft_isalpha.c $(CHR_DIR)ft_isascii.c $(CHR_DIR)ft_isspace.c \
$(CHR_DIR)ft_isdigit.c $(CHR_DIR)ft_isprint.c $(CHR_DIR)ft_tolower.c $(CHR_DIR)ft_toupper.c \
$(MEM_DIR)ft_bzero.c $(MEM_DIR)ft_calloc.c $(MEM_DIR)ft_memchr.c $(MEM_DIR)ft_memcmp.c \
$(MEM_DIR)ft_memcpy.c $(MEM_DIR)ft_memmove.c $(MEM_DIR)ft_memset.c \
$(PRINT_DIR)ft_putchar_fd.c $(PRINT_DIR)ft_putendl_fd.c $(PRINT_DIR)ft_putnbr_fd.c $(PRINT_DIR)ft_putstr_fd.c \
$(STR_DIR)ft_split.c $(STR_DIR)ft_strdup.c $(STR_DIR)ft_strjoin.c $(STR_DIR)ft_strlcpy.c $(STR_DIR)ft_strmapi.c \
$(STR_DIR)ft_strnstr.c $(STR_DIR)ft_strtrim.c $(STR_DIR)ft_strchr.c $(STR_DIR)ft_striteri.c $(STR_DIR)ft_strlcat.c \
$(STR_DIR)ft_strlen.c $(STR_DIR)ft_strncmp.c $(STR_DIR)ft_strrchr.c $(STR_DIR)ft_substr.c \
$(STR_DIR)ft_strcpy.c $(STR_DIR)ft_strcat.c $(STR_DIR)ft_strcpy.c \
$(UTIL_DIR)ft_atoi.c $(UTIL_DIR)ft_itoa.c

SRCS_BNS = $(LST_DIR)ft_lstadd_back.c $(LST_DIR)ft_lstadd_front.c $(LST_DIR)ft_lstclear.c $(LST_DIR)ft_lstdelone.c \
$(LST_DIR)ft_lstiter.c $(LST_DIR)ft_lstlast.c $(LST_DIR)ft_lstmap.c $(LST_DIR)ft_lstnew.c $(LST_DIR)ft_lstsize.c

OBJS = $(SRCS:.c=.o)

OBJS_BNS = $(SRCS_BNS:.c=.o)

all: $(NAME)
	
%.o: %.c
	$(CC) $(CFLAGS) -c -o $@ $<

$(NAME): $(OBJS)
	ar rc $(NAME) $(OBJS)
	ranlib $(NAME)

bonus: $(OBJS) $(OBJS_BNS)
	ar rc $(NAME) $(OBJS) $(OBJS_BNS)
	ranlib $(NAME)

clean:
	rm -f $(OBJS) $(OBJS_BNS)
	rm -f .*.swp
	rm -f */.*.swp
	rm -f *.so
	rm -f */*.so
	rm -f a.out
	rm -f */a.out

fclean: clean
	rm -f $(NAME)

re: fclean all

.PHONY: all clean fclean re bonus

