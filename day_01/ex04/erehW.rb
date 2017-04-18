#!/usr/bin/env ruby -w

def erehW
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

	return unless ARGV.count == 1
	capitale = ARGV[0]
	capitals_cities_inv = capitals_cities.invert
	puts capitals_cities_inv[capitale].nil? ? "Unknown capital city" : states.invert[capitals_cities_inv[capitale]]
end

erehW