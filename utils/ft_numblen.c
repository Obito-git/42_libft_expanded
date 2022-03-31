/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_numblen.c                                       :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: amyroshn <marvin@42.fr>                    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2022/01/24 09:06:50 by amyroshn          #+#    #+#             */
/*   Updated: 2022/01/24 09:06:53 by amyroshn         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */
#include "../libft.h"

size_t	ft_numblen(long numb)
{
	size_t	i;

	i = 0;
	if (numb == LONG_MIN)
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
