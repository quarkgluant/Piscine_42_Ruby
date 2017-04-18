require "ft_wikipedia/version"
require 'open-uri'
require 'Nokogiri'

class Ft_Wikipedia

  @@nb_links = 0
  @@mon_hash = Hash.new(0)
  @@mon_tab =[]

  def self.search(word)

    begin
      if @@nb_links.zero?
        puts "First search @ https://en.wikipedia.org/wiki/#{word}" 
        word = "/wiki/#{word}"
      end
      page = Nokogiri::HTML(open("https://en.wikipedia.org#{word}"))
      @@nb_links += 1
      link = page.xpath("//div[@id='mw-content-text']/p/a[starts-with(@href, '/wiki/')]").first
      raise StandardError,  "Dead end page reached" if link.nil?
      puts "https://en.wikipedia.org#{link.attributes["href"].value}"
      @@mon_tab << link.attributes["href"].value
      @@mon_hash = @@mon_tab.inject(Hash.new(0)) do 
        |mon_hash, elem| mon_hash[elem] += 1
        mon_hash
      end
      raise StandardError, "Loop detected there is no way to philosophy here" if @@mon_hash.any?{|key, val| val > 1}
      if link.attributes["href"].value == "/wiki/Philosophy"
        nombre_liens = @@nb_links 
        @@nb_links = 0
        @@mon_hash = Hash.new(0)
        @@mon_tab =[]
        return nombre_liens
      end
      self.search(link.attributes["href"].value)
    # rescue StandardError => e
    #   raise StandardError,  "Dead end page reached" 
    # rescue StandardError => e 
    #   puts e.message
    rescue Exception => e
       if e.message == '404 Not Found'
           puts "Dead end page reached"
       elsif e.message == 'Loop detected there is no way to philosophy here'
           puts "Loop detected there is no way to philosophy here"
       else
         raise e
       end
    ensure
      @@nb_links = 0
      @@mon_hash = Hash.new(0)
      @@mon_tab =[]
    end
  end

end
 # Nokogiri::HTML(open("https://en.wikipedia.org/wiki/#{word}")).xpath("//div[@id='mw-content-text']/p/a[starts-with(@href, '/wiki/')]")
 # apres first 
 # (Element:0x3fec5908aff4 {
 #  name = "a",
 #  attributes = [
 #    #(Attr:0x3fec59086648 { name = "href", value = "/wiki/Play_(activity)" }),
 #    #(Attr:0x3fec59086634 { name = "title", value = "Play (activity)" })],
 #  children = [ #(Text "play")]
 #  })