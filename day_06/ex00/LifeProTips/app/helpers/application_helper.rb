require 'nokogiri'
require 'open-uri'

module ApplicationHelper
  def get_random_animal
      url = "https://www.randomlists.com/random-animals"
      doc = Nokogiri::HTML(open(url))
      animal = doc.css('li').first.css('span').text
      animal
    end
end
