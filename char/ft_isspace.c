#include "../libft.h"

int	ft_isspace(char c)
{
	return (c == '\f' || c == '\t' || c == ' '
		|| c == '\n' || c == '\r' || c == '\v');
}

