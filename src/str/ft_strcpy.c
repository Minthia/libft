/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_strcpy.c                                        :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: hdo-minh <marvin@42.fr>                    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2018/11/07 10:23:17 by hdo-minh          #+#    #+#             */
/*   Updated: 2018/12/11 08:06:15 by hdo-minh         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include <string.h>

char	*ft_strcpy(char *dst, const char *src)
{
	size_t		i;

	i = -1;
	while (src[++i])
		dst[i] = (char)src[i];
	dst[i] = '\0';
	return (dst);
}
