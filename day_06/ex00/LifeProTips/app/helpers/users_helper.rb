require 'nokogiri'
require 'open-uri'

module UsersHelper
  def get_random_animal
    # url = 'https://www.randomlists.com/random-animals'
    # doc = Nokogiri::HTML(open(url))
    # # link = page.xpath("//div[class='Rand-stage']/li/a[starts-with(@href, '/wiki/')]").first
    # doc.css('li').first.children.text
    # le lien ne marche plus, après test, les noms ne sont plus dans l'objet doc
    # donc petite méthode pour tester
    %w(chat chien mouton vache cobra lion guépard hamster).sample
  end
end
