# **************************************************************************** #
#                                                           LE - /             #
#                                                               /              #
#    ceryneian_hind.rb                                .::    .:/ .      .::    #
#                                                  +:+:+   +:    +:  +:+:+     #
#    By: kerbault <kerbault@student.le-101.fr>      +:+   +:    +:    +:+      #
#                                                  #+#   #+    #+    #+#       #
#    Created: 2018/02/21 15:37:51 by kerbault     #+#   ##    ##    #+#        #
#    Updated: 2018/02/22 20:23:58 by kerbault    ###    #+. /#+    ###.fr      #
#                                                          /                   #
#                                                         /                    #
# **************************************************************************** #

require "oauth2"
require "colorize"

if ARGV.empty? || !File.exist?(ARGV[0]) || ARGV[1]
	puts "USAGE:".red + " ruby ceryneian_hind.rb <SINGLE_VALID_FILE>"
	exit
end

file = ARGV[0]
ARGV.clear

puts "enter API UID : ".green
UID = gets.chomp
puts "enter API SECRET : ".green
SECRET = gets.chomp

# Create the client with your credentials
client = OAuth2::Client.new(UID, SECRET, site: "https://api.intra.42.fr")
# Get an access token
token = client.client_credentials.get_token

puts "Scanning...".green
File.readlines(file).each do |line|
	sleep (0.5)
	login = line.strip
	if login.empty?
		next
	end
	begin
		response = token.get("/v2/users/#{login}")
	rescue
		puts "#{login} | " + "wrong login or api down".yellow
		next
	end
	parse = response.parsed
	location = parse["location"]
	print "#{login} | "
	if location.to_s.empty?
		puts "offline".red
	else
		puts "online".green + " | " + location.green
	end
end
puts "Done".green
