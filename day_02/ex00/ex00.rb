#!/usr/bin/env ruby -w

class Html

	attr_reader :page_name

	def initialize(filename)
		@page_name = filename
		head
	end

	def head
		File.open("#{@page_name}.html", "w") do |file|
			file << "<!DOCTYPE html>\n<html>\n<head>\n<title>#{@page_name}</title>\n</head>\n<body>\n"
		end
	end

	def dump(chaine)
		File.open("#{@page_name}.html", "a") do |file|
			file << " <p>#{chaine}</p>\n"
		end
	end

	def finish
		File.open("#{@page_name}.html", "a") do |file|
			file << "</body>\n"
		end
	end
	
end

if $PROGRAM_NAME == __FILE__
	a = Html.new("mon_test_en_plume")
	10.times{|x| a.dump("titi_number#{x}")}
	a.finish
end