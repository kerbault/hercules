# **************************************************************************** #
#                                                           LE - /             #
#                                                               /              #
#    the_cattle_of_geryon.py                          .::    .:/ .      .::    #
#                                                  +:+:+   +:    +:  +:+:+     #
#    By: kerbault <kerbault@student.le-101.fr>      +:+   +:    +:    +:+      #
#                                                  #+#   #+    #+    #+#       #
#    Created: 2018/04/11 17:40:57 by kerbault     #+#   ##    ##    #+#        #
#    Updated: 2018/04/12 20:34:34 by kerbault    ###    #+. /#+    ###.fr      #
#                                                          /                   #
#                                                         /                    #
# **************************************************************************** #

# importation / defifinition section

import requests
import sys
import time
from concurrent.futures import ThreadPoolExecutor

class bcolors:
    HEADER = '\033[95m'
    OKBLUE = '\033[94m'
    OKGREEN = '\033[92m'
    WARNING = '\033[93m'
    FAIL = '\033[91m'
    ENDC = '\033[0m'
    BOLD = '\033[1m'
    UNDERLINE = '\033[4m'

# flashy intro

print (bcolors.OKGREEN + "\n╔═════════════════════════════════════════════════════════════════════╗\n\
║ ███╗   ██╗ ██████╗ ████████╗    ███████╗██╗███████╗ ██████╗ ███████╗║\n\
║ ████╗  ██║██╔═══██╗╚══██╔══╝    ██╔════╝██║██╔════╝██╔════╝ ██╔════╝║\n\
║ ██╔██╗ ██║██║   ██║   ██║       ███████╗██║█████╗  ██║  ███╗█████╗  ║\n\
║ ██║╚██╗██║██║   ██║   ██║       ╚════██║██║██╔══╝  ██║   ██║██╔══╝  ║\n\
║ ██║ ╚████║╚██████╔╝   ██║       ███████║██║███████╗╚██████╔╝███████╗║\n\
║ ╚═╝  ╚═══╝ ╚═════╝    ╚═╝       ╚══════╝╚═╝╚══════╝ ╚═════╝ ╚══════╝║\n\
╚═════════════════════════════════════════════════════════════════════╝\n" + bcolors.ENDC)

# Info definition
print (bcolors.OKBLUE + "Information definition\n" + bcolors.ENDC)
client = int(input ("Number of clients : "))
nreq = int(input ("Number of requests per client : "))
url = str(input ("URL to siege : "))
delay = float(input ("Delay between request : "))
totalreq = client * nreq
attempt = 0
reachedrep = 0
sumtime = 0
sumsize = 0

# Testing data

print (bcolors.OKBLUE + "\nTesting data\n" + bcolors.ENDC)
try:
	r = requests.get(url)
	print ('URL reached')
except:
	print (bcolors.WARNING + 'URL : ' + url + ' Not responding, stopping process' +bcolors.ENDC)
	sys.exit(1)

# Benchmarking

print (bcolors.OKBLUE + "\nStarting benchmark\n" + bcolors.ENDC)
while attempt < totalreq:
	attempt += 1
	r = requests.get(url)
	status = r.status_code
	if status == 200:
		reachedrep += 1
		print (bcolors.OKGREEN)
	else:
		print (bcolors.FAIL)
	time = str(r.elapsed)[5:-4]
	sumtime += float(time)
	size = len(r.content)
	sumsize += size
	method = str(r.request)[18:-2]
	print ('HTTP/1.1 ', status, '\t', time, 'secs\t', size, 'bytes ==>', method, '', url)
	time.sleep(delay)

# Results

print (bcolors.OKBLUE + "\nResults\n" + bcolors.ENDC)
print ("Transactions: \t\t\t", reachedrep, " / ", totalreq, "successed")
print ('Elapsed time:\t\t\t', sumtime, 'secs')
print ('Average response time:\t\t', sumtime / reachedrep, 'secs')
print ('Data transfered:\t\t', sumsize / 1024, 'KB')
