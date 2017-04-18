#!/usr/bin/env ruby -w

# mes variables :

# 	a contient : 10 et est de type: Fixnum
# 	b contient : 10 et est de type: String
# 	c contient : dix et est de type: String
# 	d contient : 10.0 et est de type: Float
# def my_var
# 	a = 10
# 	b = "10"
# 	c = nil
# 	d = 10.0

# 	puts "mes variables"
# 	puts "\ta contient : #{a} et est de type: #{a.class}"
# 	puts "\tb contient : #{b} et est de type: #{b.class}"
# 	puts "\tc contient : #{c} et est de type: #{c.class}"
# 	puts "\td contient : #{d} et est de type: #{d.class}"
# end

def my_var
  a = 10
  b = "10"
  c = nil
  d = 10.0
  # my_tab = [a, b, c, d]
  # compteur = "a"
  puts "mes variables"
  # my_tab.each do |var|
  #   puts "\t#{compteur} contient : #{var} et est de type: #{var.class}" # ne marche pas non plus pour c
  #   compteur += 1
  # end
  puts "\ta contient : #{a.inspect} et est de type: #{a.class}"
  puts "\tb contient : #{b} et est de type: #{b.class}"
  puts "\tc contient : #{c.inspect} et est de type: #{c.class}"
  puts "\td contient : #{d.inspect} et est de type: #{d.class}"
end

my_var
