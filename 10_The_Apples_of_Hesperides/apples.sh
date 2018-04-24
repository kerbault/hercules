#!/bin/bash

# **************************************************************************** #
#                                                           LE - /             #
#                                                               /              #
#    apples.sh                                        .::    .:/ .      .::    #
#                                                  +:+:+   +:    +:  +:+:+     #
#    By: kerbault <kerbault@student.le-101.fr>      +:+   +:    +:    +:+      #
#                                                  #+#   #+    #+    #+#       #
#    Created: 2018/04/18 15:15:07 by kerbault     #+#   ##    ##    #+#        #
#    Updated: 2018/04/18 15:15:21 by kerbault    ###    #+. /#+    ###.fr      #
#                                                          /                   #
#                                                         /                    #
# **************************************************************************** #

USER=kerbault
IP=127.0.0.1
PORT=1234

ssh-keygen -q -t rsa -f /Users/kerbault/.ssh/id_rsa -N ""
ssh-copy-id -p $PORT -i ~/.ssh/id_rsa.pub $USER@$IP
ssh $USER@$IP -p $PORT