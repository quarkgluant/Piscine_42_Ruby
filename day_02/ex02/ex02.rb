#!/usr/bin/env ruby -w

class Dup_file < StandardError
  
  attr_reader :page_name

  def initialize(page_name)
    @page_name = page_name
  end

	def show_state
    path = File.expand_path @page_name + ".html"
    puts "A file named #{@page_name} was already there: #{path}"
	end

	def correct
    @new_file = @page_name + ".new"
		begin
			raise error = Dup_file.new(@new_file) if File.file? "#{@new_file}.html"
		rescue => error
				@new_file = error.correct
		end
		File.open("#{@new_file}.html", "w+")
		@new_file
	end

	def explain
    new_file_path = File.expand_path("#{@new_file}.html")
    puts "Appended .new in order to create requested file: #{new_file_path}"
	end

end

class Body_closed < StandardError

  attr_reader :page_name

  def initialize(page_name)
    @page_name = page_name
  end

	def show_state
		puts "In #{@page_name}.html body was closed."
	end

	def correct
		tmp = []
		File.open("#{@page_name}.html", "r") do |file|
			file.each_with_index do |line, nb_line|
				tmp << line unless line.include? "</body>"
				@num_line = nb_line + 1
			end
		end
		File.open("#{@page_name}.html", "w") do |file|
		 	tmp.each {|line| file << line }
		 end
	end

	def explain
    puts "> ln :#{@num_line} </body> : text has been inserted and tag moved at the end of it."
	end
end

class Html

	attr_reader :page_name

	def initialize(filename)
		@page_name = filename
		head
	end

	def head
		if File.file?("#{@page_name}.html")
			begin
				raise mon_exception = Dup_file.new(@page_name)
			rescue => mon_exception
				mon_exception.show_state
				@page_name = mon_exception.correct
				mon_exception.explain
			end
		end	
		File.open("#{@page_name}.html", "w") do |file|
			file << "<!DOCTYPE html>\n<html>\n<head>\n<title>#{@page_name}</title>\n</head>\n<body>\n"
		end
	end

	def dump(chaine)
		File.open("#{@page_name}.html", "a+") do |file|
			tab = file.readlines
			if tab.any?{|line| line.include?("</body>")}
				begin
					raise mon_exception = Body_closed.new(@page_name)
				rescue => mon_exception
					mon_exception.show_state
					mon_exception.correct
					mon_exception.explain
				end
			end			
			raise "There is no body tag in #{@page_name}.html" if tab.none?{|line| line.include?("<body>")}
			file << "<p>#{chaine}</p>\n"
		end
	end

	def finish
		File.open("#{@page_name}.html", "a+") do |file|
			raise "#{@page_name}.html has already been closed." if file.any?{|line| line.include?("</body>")}
			file << "</body>\n"
		end
	end
	
end

if $PROGRAM_NAME == __FILE__
	a = Html.new("toto")
	10.times{|x| a.dump("titi_number#{x}")}
	a.finish
	a.dump("toto was here")
end

