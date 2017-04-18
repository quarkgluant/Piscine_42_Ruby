#!/usr/bin/env ruby -w

def whereto
	states = {
		"Oregon" => "OR",
		"Alabama" => "AL",
		"New Jersey" => "NJ",
		"Colorado" => "CO"
	}

	capitals_cities = {
		"OR" => "Salem",
		"AL" => "Montgomery",
		"NJ" => "Trenton",
		"CO" => "Denver"
	}

	states_inv = states.invert
	capitals_cities_inv = capitals_cities.invert

	return unless ARGV.count == 1 && ARGV[0].class == "".class
	tab = ARGV[0].split(",").map{|item| item.strip.capitalize}
	tab.each do |elem|
		if states.has_key?(elem)
			puts  "#{capitals_cities[states[elem]]} is the capital of #{elem} (akr: #{states[elem]})"
		elsif capitals_cities_inv.has_key?(elem)
			puts  "#{elem} is the capital of #{states_inv[capitals_cities_inv[elem]]} (akr: #{capitals_cities_inv[elem]})"
		else
			puts "#{elem} is neither a capital city nor a state" unless elem.empty?
		end
	end
end

whereto