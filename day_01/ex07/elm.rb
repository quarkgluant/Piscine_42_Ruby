#!/usr/bin/env ruby -w

# def lecture
#   mon_tab = []
#   File.open("periodic_table.txt", "r") do |file|
#     file.each{|line| mon_tab << line}
#   end
#   classification = {}
#   mon_tab.each do |line|
#     classification line.split(",")

# def puts_begin_html
# end

# def insert
# end

# def puts_end_html
# end

# def elm

#   contentsArray = []
#   data = []  

#   if File.exist? 'periodic_table.txt'
#     File.foreach( 'periodic_table.txt' ) { |line| data.push(line) }
#   end


#   tab =[]

#   puts_begin_html

#   data.each do |line| 
#     #Hydrogen = position:0, number:1, small: H, molar:1.00794, electron:1
#     if line =~ /^[^\ ]+ = position\:[^\ ]+, number\:[^\ ]+, small\: [^\ ]+, molar\:[^\ ]+, electron\:.*/
#       elt = /^([^\ ]+) = position\:([^\ ]+), number\:([^\ ]+), small\: ([^\ ]+), molar\:([^\ ]+), electron\:.*/.match(line)
#       #puts elt.captures.to_s
#       tab << (elt.captures)
#     else
#       puts "KO #{line}"
#     end
#   end

#   # tab.each { |elt| puts elt.to_s + "\n" }

#   puts_end_html 
#   tab
# end

# elm
#!/usr/bin/env ruby -w

def puts_begin_html(io)

  begin_html = <<BEGINHTML
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Classement périodique des éléments</title>
  <style>
    body { background-image:url("http://fr.cdn.v5.futura-sciences.com/buildsv6/images/wide1920/6/5/9/659ca9cb1a_81627_physique-chimie.jpg") }
    h1   {   
      text-align: center;
      color: black;
      background-color: yellow;
      border-color: black;
      border: 2px solid;
      border-radius: 3px;
    }
    h4{font-size:12px }
    table    {  text-align:center ; 
          width : 100%; }
    img  { background-color : white }
    td {
      border : 2px solid;
      border-radius: 3px;
      width:5.5%;
      height:60px;
    }
    #me {
      font-family: monospace;
        font-style: italic;
        text-align:right
    }

    td.Alkali_metal { 
      background-color : rgb(255, 102, 102);
    }
    td.Alkaline_earth_metal { 
      background-color : rgb(255, 222, 173);
    }
    td.Lan­thanide { 
      background-color : rgb(255, 191, 255);
    }
    td.Actinide { 
      background-color : rgb(255, 153, 204);
    }
    td.Transition_metal { 
      background-color : rgb(255, 192, 192);
    }
    td.Post_transition_metal { 
      background-color : rgb(204, 204, 204);
    }
    td.Metalloid { 
      background-color : #cccc99;
    }
    td.Polyatomic_nonmetal { 
      background-color : rgb(161, 255, 195);
    }
    td.Diatomic_nonmetal { 
      background-color : rgb(231, 255, 143) ;
    }
    td.Noble_gas { 
      background-color : rgb(192, 255, 255);
    }
    td.Unkbow_chemical_property { 
      background-color : #e8e8e8;
    }
    div.noato { 
      text-align: left;
      font-family: Arial;  font-size: 9px;text-decoration:none;margin:0;padding:0;
    }
    div.symbol { 
      font-family: Arial;  font-size: 36px;text-decoration:none;margin:0;padding:0;
      height:50px;
    }
    div.massato {
      text-align: right;
      font-family: Arial;  font-size: 9px;text-decoration:none;margin:0;padding:0;
    }
    td.vide{
      border : 0px;
    }
    ul{list-style-type: none;
      width:100%;
      padding-left:0
    }
    li{ }
  </style>
</head>
<body>
  <h1>Classement périodique des éléments</h1> 
BEGINHTML
  io.puts begin_html
end

def insert_td(io, elt)
  #0                    1        2         3          4               5
  #Hydrogen = position:0, number:1, small: H, molar:1.00794, electron:1
    numato = elt[2];
    symbol = elt[3];
    massatomique = elt[4];
    nom = elt[0];
    group = "Noble_gas";

  #Chaque case du tableau contient au milieu et en GROS le symbole de l’élément, et en petit le numéro de l’élément, ainsi que son poids atomique, respectivement dans les coins inférieur gauche et supérieur droit.
    io.puts "\t<td class='#{group}'>"
    io.puts "\t\t<h4>#{nom}</h4>"
    io.puts "\t\t<ul><li><div class='massato'>#{massatomique}</div></li>"
    io.puts "\t\t<li><div class='symbol'>#{symbol}</div></li>"
    io.puts "\t\t<li><div class='noato'>#{numato}</div></li></ul>"
    io.puts "\t</td>"
end

def insert_td_vide(io)
  io.puts "\t<td class='vide'></td>"
end

def puts_end_html(io)
  end_html = <<ENDHTML
    <hr>
</body>
</html>
ENDHTML
  io.puts end_html
end

def tab_construct

  data = []  

  if File.exist? 'periodic_table.txt'
    File.foreach( 'periodic_table.txt' ) { |line| data.push(line) }
  end


  tab =[]

  data.each do |line| 
    #Hydrogen = position:0, number:1, small: H, molar:1.00794, electron:1
    if line =~ /^[^\ ]+ = position\:[^\ ]+, number\:[^\ ]+, small\: [^\ ]+, molar\:[^\ ]+, electron\:[^\ ]+( [^\ ]+)*$/
      elt = /^([^\ ]+) = position\:([^\ ]+), number\:([^\ ]+), small\: ([^\ ]+), molar\:([^\ ]+), electron\:(.*)$/.match(line)
      #puts elt.captures.to_s
      tab.push(elt.captures)
    else
      puts "KO #{line}"
    end
  end

  #tab.each { |elt| puts n.to_s + "\n" }

  tab
end

def put_table_in_file(io)
  tab = tab_construct

  lignes = 0..6
  colonnes = 0..17

  cpt = 0
  io.puts "<table>"
  lignes.each do |l|
    io.puts "<tr>"
    colonnes.each do |c|
      if tab[cpt][1].to_i ==  c
        insert_td(io, tab[cpt])
        cpt += 1
      else
        insert_td_vide(io)
      end
    end
    io.puts "</tr>";
  end
  io.puts "</table>";
end

def elm(args)
  if(args.length == 1)
    io = File.open(args[0], 'w')
    puts_begin_html(io)
    put_table_in_file(io)
    puts_end_html(io)
  end
end

elm(ARGV)
