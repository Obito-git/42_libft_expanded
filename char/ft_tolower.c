/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_tolower.c                                       :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: amyroshn <marvin@42.fr>                    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2021/11/23 11:15:41 by amyroshn          #+#    #+#             */
/*   Updated: 2021/11/23 11:22:44 by amyroshn         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "libft.h"
/*
*	linux fix for libft-unit-test
*	https://github.com/alelievr/libft-unit-test
*	
*	line 28 insert
*    
*	else if (c < -1)
*    	return (c + 256);
*/

int	ft_tolower(int c)
{
	if (c >= 'A' && c <= 'Z')
		return (c + 32);
	return (c);
}
