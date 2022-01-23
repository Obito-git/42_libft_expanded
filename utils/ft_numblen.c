#include "../libft.h"

size_t	ft_numblen(long numb)
{
	size_t	i;

	i = 0;
	if (numb == LONG_MIN - 1)
		return (20);
	if (numb <= 0)
	{
		numb *= -1;
		i++;
	}
	while (numb > 0)
	{
		numb /= 10;
		i++;
	}
	return (i);
}
