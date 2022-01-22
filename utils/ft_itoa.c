/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_itoa.c                                          :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: amyroshn <marvin@42.fr>                    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2021/11/23 11:52:03 by amyroshn          #+#    #+#             */
/*   Updated: 2021/11/23 11:52:28 by amyroshn         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "libft.h"

static char	*ft_strcpy(char	*dest, const char	*src)
{
	int	i;

	i = 0;
	while (src[i])
	{
		dest[i] = src[i];
		i++;
	}
	dest[i] = '\0';
	return (dest);
}

static int	get_numblen(int n)
{
	int	size;

	size = 1;
	if (n == -2147483648)
		return (11);
	if (n < 0)
	{
		n *= -1;
		size++;
	}
	while (n >= 10)
	{
		n /= 10;
		size++;
	}
	return (size);
}

static int	check_negative(char *str, int *last_index, int *n)
{
	if (*n == -2147483648)
	{
		ft_strcpy(str, "-2147483648");
		return (1);
	}
	if (*n < 0)
	{
		*last_index = 1;
		str[0] = '-';
		*n *= -1;
	}
	return (0);
}

char	*ft_itoa(int n)
{
	int		numb_size;
	char	*res;
	int		last_index;

	numb_size = get_numblen(n);
	last_index = 0;
	res = (char *) malloc(numb_size + 1);
	if (!res)
		return (NULL);
	res[numb_size--] = 0;
	if (check_negative(res, &last_index, &n))
		return (res);
	while (numb_size >= last_index)
	{
		res[numb_size] = n % 10 + '0';
		n /= 10;
		numb_size--;
	}
	return (res);
}
