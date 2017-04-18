#!/usr/bin/env ruby -w

def cafecroissant
	data = [
		['Frank', 33],
		['Stacy', 15],
		['Juan' , 24],
		['Dom' , 32],
		['Steve', 24],
		['Jill', 24]
	]

	data.sort_by{ |nom, age| [age, nom] }.each{|tab| puts tab.first}
end

cafecroissant