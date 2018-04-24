/* ************************************************************************** */
/*                                                          LE - /            */
/*                                                              /             */
/*   hydra.c                                          .::    .:/ .      .::   */
/*                                                 +:+:+   +:    +:  +:+:+    */
/*   By: kerbault <kerbault@student.le-101.fr>      +:+   +:    +:    +:+     */
/*                                                 #+#   #+    #+    #+#      */
/*   Created: 2018/02/15 18:12:06 by kerbault     #+#   ##    ##    #+#       */
/*   Updated: 2018/02/16 19:40:57 by kerbault    ###    #+. /#+    ###.fr     */
/*                                                         /                  */
/*                                                        /                   */
/* ************************************************************************** */

#include <netdb.h>
#include <string.h>
#include <stdlib.h>
#include <sys/socket.h>
#include <sys/types.h>
#include <unistd.h>

void			ft_ping_pong(char *str, int client_fd)
{
	while (1)
	{
		bzero(str, 128);
		read(client_fd, str, 128);
		if (strcmp("ping\r\n", str) == 0)
			write(client_fd, "pong pong\n", 10);
	}
}

int				main(int ac, char **av)
{
	char				str[128];
	int					srv_fd;
	int					client_fd;
	int					port;
	struct sockaddr_in	srv_addr;

	if (ac != 2 || atoi(av[1]) < 1024 || atoi(av[1]) > 65535)
	{
		write(2, "Please, select one port between 1024 and 65535.\n", 48);
		return (-1);
	}
	port = atoi(av[1]);
	if ((srv_fd = socket(AF_INET, SOCK_STREAM, 0)) == -1)
		return (-1);
	bzero(&srv_addr, sizeof(srv_addr));
	srv_addr.sin_family = AF_INET;
	srv_addr.sin_port = htons(port);
	srv_addr.sin_addr.s_addr = htons(INADDR_ANY);
	bind(srv_fd, (struct sockaddr *)&srv_addr, sizeof(srv_addr));
	listen(srv_fd, 42);
	client_fd = accept(srv_fd, (struct sockaddr*)NULL, NULL);
	ft_ping_pong(str, client_fd);
	return (0);
}
