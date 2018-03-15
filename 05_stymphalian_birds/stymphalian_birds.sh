#!/bin/bash
clear

# intro

printf "\033[32m ----------------------------------------------------------------------------------\n"
printf "|                                                                                  |\n"
printf "| ██╗      █████╗ ███████╗██╗   ██╗    ███╗   ███╗ █████╗ ██╗  ██╗███████╗██████╗  |\n"
printf "| ██║     ██╔══██╗╚══███╔╝╚██╗ ██╔╝    ████╗ ████║██╔══██╗██║ ██╔╝██╔════╝██╔══██╗ |\n"
printf "| ██║     ███████║  ███╔╝  ╚████╔╝     ██╔████╔██║███████║█████╔╝ █████╗  ██████╔╝ |\n"
printf "| ██║     ██╔══██║ ███╔╝    ╚██╔╝      ██║╚██╔╝██║██╔══██║██╔═██╗ ██╔══╝  ██╔══██╗ |\n"
printf "| ███████╗██║  ██║███████╗   ██║       ██║ ╚═╝ ██║██║  ██║██║  ██╗███████╗██║  ██║ |\n"
printf "| ╚══════╝╚═╝  ╚═╝╚══════╝   ╚═╝       ╚═╝     ╚═╝╚═╝  ╚═╝╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝ |\n"
printf "|        It's dangerous to go alone, make this ~                                   |\n"
printf " ---------------------------------------------------------------------------------- \n\n"
printf "\033[32mLazy buddy\033[37m : Hi $USER, I'm here to help you to build your awesome project base !\n\n"

sleep 0.5
printf "\033[32mLazy buddy\033[37m : First of all, what name do you want to give to your project?\n\n"
while true; do
    printf "\033[36mYou\033[37m : "
    read name
    printf "\n"
    if ! test -d $name
    then
       mkdir $name;
       break
    fi
    printf "\033[32mLazy buddy\033[37m : Outch, this name is already used, please choose another one\n\n"
done

# autor file

sleep 0.5
printf "\033[32mLazy buddy\033[37m : Do you want an to include an autor file ?\n\n"
while true; do
    printf "\033[36mYou\033[37m : "
    read resp
    resp=$(echo "$resp" | tr '[:upper:]' '[:lower:]')
    printf "\n"
    if [ "$resp" = "yes" ] || [ "$resp" = "y" ]
    then
        echo $USER > ./$name/auteur
        break
    elif [ "$resp" = "no" ] || [ "$resp" = "n" ]
    then
        break
    else
        printf "\033[32mLazy buddy\033[37m : God dammit ! Just respond by \"yes\" or \"no\" !\n\n"
    fi
done

# .gitignore

sleep 0.5
printf "\033[32mLazy buddy\033[37m : Fine, do you want to add my .gitignore (base intended for C)?\n\n"
while true; do
    printf "\033[36mYou\033[37m : "
    read resp
    resp=$(echo "$resp" | tr '[:upper:]' '[:lower:]')
    printf "\n"
    if [ "$resp" = "yes" ] || [ "$resp" = "y" ]
    then
        echo "*.d" > ./$name/.gitignore
        echo "*.o" >> ./$name/.gitignore
        echo "*.ko" >> ./$name/.gitignore
        echo "*.obj" >> ./$name/.gitignore
        echo "*.elf" >> ./$name/.gitignore
        echo "*.ilk" >> ./$name/.gitignore
        echo "*.map" >> ./$name/.gitignore
        echo "*.exp" >> ./$name/.gitignore
        echo "*.gch" >> ./$name/.gitignore
        echo "*.pch" >> ./$name/.gitignore
        echo "*.lib" >> ./$name/.gitignore
        echo "*.a" >> ./$name/.gitignore
        echo "*.la" >> ./$name/.gitignore
        echo "*.lo" >> ./$name/.gitignore
        echo "*.dll" >> ./$name/.gitignore
        echo "*.so" >> ./$name/.gitignore
        echo "*.so.*" >> ./$name/.gitignore
        echo "*.dylib" >> ./$name/.gitignore
        echo "*.exe" >> ./$name/.gitignore
        echo "*.out" >> ./$name/.gitignore
        echo "*.app" >> ./$name/.gitignore
        echo "*.i*86" >> ./$name/.gitignore
        echo "*.x86_64" >> ./$name/.gitignore
        echo "*.hex" >> ./$name/.gitignore
        echo "*.dSYM/" >> ./$name/.gitignore
        echo "*.su" >> ./$name/.gitignore
        echo "*.idb" >> ./$name/.gitignore
        echo "*.pdb" >> ./$name/.gitignore
        echo "*.mod*" >> ./$name/.gitignore
        echo "*.cmd" >> ./$name/.gitignore
        echo ".tmp_versions/" >> ./$name/.gitignore
        echo "modules.order" >> ./$name/.gitignore
        echo "Module.symvers" >> ./$name/.gitignore
        echo "Mkfile.old" >> ./$name/.gitignore
        echo "dkms.conf" >> ./$name/.gitignore
        break
    elif [ "$resp" = "no" ] || [ "$resp" = "n" ]
    then
        break
    else
        printf "\033[32mLazy buddy\033[37m : God dammit ! Just respond by \"yes\" or \"no\" !\n\n"
    fi
done

# language selection

sleep 0.5
printf "\033[32mLazy buddy\033[37m : Thanks, now what kind of language do you want to use ? (c, c++, ruby, \nfrench...?)\n\n"
while true; do
    printf "\033[36mYou\033[37m : "
    read language
    language=$(echo "$language" | tr '[:upper:]' '[:lower:]')
    printf "\n"
    if [ "$language" = "c" ]
    then
        printf "\033[32mLazy buddy\033[37m : C is Good to me <3\n\n"
        break
    elif [ "$language" = "ruby" ] || [ "$language" = "python" ] || [ "$language" = "c++" ] || [ "$language" = "java" ]
    then    
        language="c"
        printf "\033[32mLazy buddy\033[37m : Pff, I don't like this one, That will be C anyway !\n\n"
        break
    elif [ "$language" = "french" ]
    then
        printf "\033[32mLazy buddy\033[37m : Are you really that dumb ? French baguette du fromage ! Try again \nplease.\n\n"
    elif [ "$language" = "none" ]
    then
        language="none"
        printf "\033[32mLazy buddy\033[37m : I see, you prefer to do things on your own !\n\n"
        break
    else
        printf "\033[32mLazy buddy\033[37m : I don't know this language, please pick something else or say \"None\"\n\n"
    fi
done

if [ "$language" = "c" ]
then
    mkdir ./$name/src
    mkdir ./$name/src/lib    
    sleep 0.5
    
    # C - get the lib

    printf "\033[32mLazy buddy\033[37m : Would you like to get my personal Lib ?\n\n"
    while true; do
        printf "\033[36mYou\033[37m : "
        read resp
        resp=$(echo "$resp" | tr '[:upper:]' '[:lower:]')
        printf "\n"
        if [ "$resp" = "yes" ] || [ "$resp" = "y" ]
        then
            git clone https://github.com/kerbault/libft.git
            if ! test -d libft
            then
                printf "\n\033[32mLazy buddy\033[37m : Outch, it looks like I cannot get my lib, you will have to go on your own !\n\n"
            else
                rm -rf ./libft/.git ./libft/libft.fr.pdf
                mv libft ./$name/src/lib
                printf "\n\033[32mLazy buddy\033[37m : The lib has been correctely installed :)\n\n"
            fi
            break
        elif [ "$resp" = "no" ] || [ "$resp" = "n" ]
        then
            printf "\033[32mLazy buddy\033[37m : How rude :(\n\n"
            break
        else
            printf "\033[32mLazy buddy\033[37m : God dammit ! Just respond by \"yes\" or \"no\" !\n\n"
        fi
    done

    # main

    printf "\033[32mLazy buddy\033[37m : Do you want a main.c (with basic test in it) ?\n\n"
    while true; do
        printf "\033[36mYou\033[37m : "
        read resp
        resp=$(echo "$resp" | tr '[:upper:]' '[:lower:]')
        printf "\n"
        if [ "$resp" = "yes" ] || [ "$resp" = "y" ]
        then
            echo "#include <stdio.h>" > ./$name/src/main.c
            echo "" >> ./$name/src/main.c
            echo "int   main(int argc, char **argv)" >> ./$name/src/main.c
            echo "{" >> ./$name/src/main.c
            echo "  if(argc == 2)" >> ./$name/src/main.c
            echo "      printf(\"%s\", argv[1]);" >> ./$name/src/main.c
            echo "  return(0);" >> ./$name/src/main.c
            echo "}" >> ./$name/src/main.c
            break
        elif [ "$resp" = "no" ] || [ "$resp" = "n" ]
        then
            printf "\033[32mLazy buddy\033[37m : How rude :(\n\n"
            break
        else
            printf "\033[32mLazy buddy\033[37m : God dammit ! Just respond by \"yes\" or \"no\" !\n\n"
        fi
    done

    # C - makefile

    printf "\033[32mLazy buddy\033[37m : Now, do you want my Makefile ?\n\n"
    while true; do
        printf "\033[36mYou\033[37m : "
        read resp
        resp=$(echo "$resp" | tr '[:upper:]' '[:lower:]')
        printf "\n"
        if [ "$resp" = "yes" ] || [ "$resp" = "y" ]
        then
            echo "SHELL		:= /bin/bash" > ./$name/Makefile
            echo "" >> ./$name/Makefile
            echo "#### System configuration section ####" >> ./$name/Makefile
            echo "" >> ./$name/Makefile
            echo "NAME		:= $name" >> ./$name/Makefile
            echo "CC			:= gcc" >> ./$name/Makefile
            echo "CFLAGS		:= -Wall -Wextra -Werror" >> ./$name/Makefile
            echo "AR			:= ar" >> ./$name/Makefile
            echo "ARFLAGS		:= rc" >> ./$name/Makefile
            echo "RANLIB		:= ranlib" >> ./$name/Makefile
            echo "MKDIR		:= mkdir" >> ./$name/Makefile
            echo "MKDIRFLAGS	:= -p" >> ./$name/Makefile
            echo "RM			:= /bin/rm" >> ./$name/Makefile
            echo "RMFLAGS		:= -rf" >> ./$name/Makefile
            echo "ECHO		:= echo" >> ./$name/Makefile
            echo "QUIET		:= @" >> ./$name/Makefile
            echo "NORM		:= norminette" >> ./$name/Makefile
            echo "" >> ./$name/Makefile
            echo "#### Libraries def section ####" >> ./$name/Makefile
            echo "" >> ./$name/Makefile
            echo "LIBFTDIR	:= ./src/lib/libft" >> ./$name/Makefile
            echo "LIBFT		:= ft" >> ./$name/Makefile
            echo "" >> ./$name/Makefile
            echo "#### Files definition section ####" >> ./$name/Makefile
            echo "" >> ./$name/Makefile
            echo "INCLUDESDIR	:= includes" >> ./$name/Makefile
            echo "INCLUDES	:= -I\$(INCLUDESDIR)/ -I\$(LIBFTDIR)/\$(INCLUDESDIR)" >> ./$name/Makefile
            echo "SRCDIR		:= src" >> ./$name/Makefile
            if test -e ./$name/src/main.c
            then
                echo "SRCS		:= main.c" >> ./$name/Makefile
            else
                echo "SRCS		:= # INCLUDE YOUR SRCS HERE #" >> ./$name/Makefile
            fi
            echo "OBJDIR		:= obj" >> ./$name/Makefile
            echo "OBJS		:= \$(addprefix \$(OBJDIR)/, \$(SRCS:.c=.o))" >> ./$name/Makefile
            echo "" >> ./$name/Makefile
            echo "#### Linking configuration section ####" >> ./$name/Makefile
            echo "" >> ./$name/Makefile
            echo "LDIBRARIES	:= -L\$(LIBFTDIR)/ -l\$(LIBFT)" >> ./$name/Makefile
            echo "" >> ./$name/Makefile
            echo "#### Rules section ####" >> ./$name/Makefile
            echo "" >> ./$name/Makefile
            echo ".PHONY: all clean fclean re norm gpush" >> ./$name/Makefile
            echo "" >> ./$name/Makefile
            echo "all: \$(NAME)" >> ./$name/Makefile
            echo "" >> ./$name/Makefile
            echo "\$(NAME): \$(LIBFTDIR)/libft.a \$(OBJDIR) \$(OBJS)" >> ./$name/Makefile
            echo "	\$(QUIET)\$(ECHO) \"Creating the executable\"" >> ./$name/Makefile
            echo "	\$(QUIET)\$(CC) \$(CCFLAGS) \$(LDIBRARIES) \$(OBJS) -o \$@" >> ./$name/Makefile
            echo "	\$(QUIET)\$(ECHO) \"Done\"" >> ./$name/Makefile
            echo "" >> ./$name/Makefile
            echo "\$(OBJDIR):" >> ./$name/Makefile
            echo "	\$(QUIET)\$(MKDIR) \$(MKDIRFLAGS) \$(OBJDIR)" >> ./$name/Makefile
            echo "" >> ./$name/Makefile
            echo "\$(LIBFTDIR)/libft.a:" >> ./$name/Makefile
            echo "	\$(QUIET)\$(ECHO) \"Creating the lib\"" >> ./$name/Makefile
            echo "	\$(QUIET)\$(MAKE) -C \$(LIBFTDIR)" >> ./$name/Makefile
            echo "" >> ./$name/Makefile
            echo "\$(OBJDIR)/%.o: \$(SRCDIR)/%.c" >> ./$name/Makefile
            echo "	\$(QUIET)\$(ECHO) \"Compiling $<\"" >> ./$name/Makefile
            echo "	\$(QUIET)\$(CC) \$(CFLAGS) -I\$(INCLUDESDIR) -c $< -o \$@" >> ./$name/Makefile
            echo "" >> ./$name/Makefile
            echo "clean:" >> ./$name/Makefile
            echo "	\$(QUIET)\$(ECHO) \"Cleaning the objects\"" >> ./$name/Makefile
            echo "	\$(QUIET)\$(RM) \$(RMFLAGS) \$(OBJS)" >> ./$name/Makefile
            echo "" >> ./$name/Makefile
            echo "fclean: clean" >> ./$name/Makefile
            echo "	\$(QUIET)\$(ECHO) \"Deleting the library\"" >> ./$name/Makefile
            echo "	\$(QUIET)\$(RM) \$(RMFLAGS) \$(NAME) \$(OBJDIR)" >> ./$name/Makefile
            echo "" >> ./$name/Makefile
            echo "re: fclean all" >> ./$name/Makefile
            echo "" >> ./$name/Makefile
            echo "norm:" >> ./$name/Makefile
            echo "	\$(QUIET)\$(ECHO) \"Checking norm 101\"" >> ./$name/Makefile
            echo "	\$(QUIET)\$(NORM) \$(SRCDIR)/\$(SRC) \$(INCLUDESDIR)/*.h" >> ./$name/Makefile
            echo "" >> ./$name/Makefile
            echo "gpush: fclean" >> ./$name/Makefile
            echo "	\$(QUIET) git add *" >> ./$name/Makefile
            echo "	\$(QUIET) git commit -m \"quick push\"" >> ./$name/Makefile
            echo "	\$(QUIET) git push" >> ./$name/Makefile
            
            break
        elif [ "$resp" = "no" ] || [ "$resp" = "n" ]
        then
            printf "\033[32mLazy buddy\033[37m : How rude :(\n\n"
            break
        else
            printf "\033[32mLazy buddy\033[37m : God dammit ! Just respond by \"yes\" or \"no\" !\n\n"
        fi
    done
fi