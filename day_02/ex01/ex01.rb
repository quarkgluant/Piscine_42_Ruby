#!/usr/bin/env ruby -w

class Html

  attr_reader :page_name

  def initialize(filename)
    @page_name = filename
    head
  end

  def head
    raise "A file #{@page_name}.html named already exist!" if File.file?("#{@page_name}.html")
    File.open("#{@page_name}.html", "w") do |file|
      file << "<!DOCTYPE html>\n<html>\n<head>\n<title>#{@page_name}</title>\n</head>\n<body>\n"
    end
  end

  def dump(chaine)
    File.open("#{@page_name}.html", "a+") do |file|
      tab = file.readlines
      raise "Body has already been closed in #{@page_name}.html" if tab.any?{|line| line.include?("</body>")}
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
  a = Html.new("test")
  10.times{|x| a.dump("titi_number#{x}")}
  a.finish
 
  b = Html.new("test2")
  10.times{|x| b.dump("titi_number#{x}")}
  b.finish
  b.dump "test again"

  c = Html.new("test2")
  c.finish

end