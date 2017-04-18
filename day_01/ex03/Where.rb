#!/usr/bin/env ruby -w

def where
		
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
	etat = ARGV[0]
	puts states[etat].nil? ? "Unknow state" : capitals_cities[states[etat]] 
end

where