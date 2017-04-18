#!/usr/bin/env ruby -w
def croissant
	mon_tab = []
	File.open("numbers.txt", "r") {|file| file.each(","){|line| mon_tab << line} }		
	mon_tab.map {|el| el.to_i}.sort.each{|e| puts e}
end
# Pour generer le fichier
# File.open("numbers.txt", "w") do |file|
# 	99.times {f<< (rand * 100).round.to_s + "," }
# 	f<< (rand * 100).round.to_s
# end

croissant