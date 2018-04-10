# **************************************************************************** #
#                                                           LE - /             #
#                                                               /              #
#    Girdle.py                                        .::    .:/ .      .::    #
#                                                  +:+:+   +:    +:  +:+:+     #
#    By: kerbault <kerbault@student.le-101.fr>      +:+   +:    +:    +:+      #
#                                                  #+#   #+    #+    #+#       #
#    Created: 2018/04/04 21:24:40 by kerbault     #+#   ##    ##    #+#        #
#    Updated: 2018/04/04 23:27:21 by kerbault    ###    #+. /#+    ###.fr      #
#                                                          /                   #
#                                                         /                    #
# **************************************************************************** #

import smtplib
import getpass
import sys

from email.MIMEMultipart import MIMEMultipart
from email.MIMEText import MIMEText
from email.MIMEBase import MIMEBase

Fromadd = raw_input("From : ")
Toadd = raw_input("To : ")
subject = raw_input("Subject : ")
print "Enter/Paste your content. Ctrl-D or double enter to save it."
content = ""
while True:
	try:
		line = raw_input("").decode('utf8')
	except EOFError:
		break
	if not line:
		break
	content = content + '\n' + line
mdp = getpass.getpass("mdp : ")
message = MIMEMultipart()
message['From'] = Fromadd
message['To'] = Toadd
message['Subject'] = subject
message.attach(content)

serveur = smtplib.SMTP('smtp.gmail.com', 587)
serveur.starttls()
try:
	serveur.login(Fromadd, mdp)
except:
	print("Wrong login or password")
	sys.exit(0)
texte = message.as_string().encode('utf8')
serveur.sendmail(Fromadd, Toadd, texte)
serveur.quit()