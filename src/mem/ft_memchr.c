/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_memchr.c                                        :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: hdo-minh <marvin@42.fr>                    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2018/11/07 10:01:59 by hdo-minh          #+#    #+#             */
/*   Updated: 2018/11/11 10:32:42 by hdo-minh         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include <stdlib.h>

void	*ft_memchr(const void *s, int c, size_t n)
{
	size_t			i;
	unsigned char	*src;

	i = -1;
	src = (unsigned char*)s;
	while (++i < n)
	{
		if (src[i] == (unsigned char)c)
			return (src + i);
	}
	return (NULL);
}
