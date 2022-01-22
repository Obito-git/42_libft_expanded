#include "../libft.h"

char	*ft_strcat(char *dest, const char *src)
{
	size_t	dest_len;
	size_t	i;

	i = 0;
	dest_len = ft_strlen(dest);
	while (src[i])
	{
		dest[dest_len] = src[i];
		i++;
		dest_len++;
	}
	dest[dest_len] = '\0';
	return (dest);
}
