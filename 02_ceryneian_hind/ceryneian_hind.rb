# **************************************************************************** #
#                                                           LE - /             #
#                                                               /              #
#    ceryneian_hind.rb                                .::    .:/ .      .::    #
#                                                  +:+:+   +:    +:  +:+:+     #
#    By: kerbault <kerbault@student.le-101.fr>      +:+   +:    +:    +:+      #
#                                                  #+#   #+    #+    #+#       #
#    Created: 2018/02/21 15:37:51 by kerbault     #+#   ##    ##    #+#        #
#    Updated: 2018/02/22 20:22:22 by kerbault    ###    #+. /#+    ###.fr      #
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
# UID = gets.chomp
UID = "b502b8ac2baee9a252ad29de3a0b89db7f2b2435df2d216df4344552503a553c"
puts "enter API SECRET : ".green
# SECRET = gets.chomp
SECRET = "56a1691d5253522e114988e9d1e9cbfe43ef9d0f06fde4f595a92fc42b67c5d8"

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
