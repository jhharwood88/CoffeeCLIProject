require 'open-uri'
require 'pry'
require 'nokogiri'

class CoffeeScraper::Scraper

	attr_accessor :types_of_coffee

	def self.scrape

		doc = Nokogiri::HTML(open("https://www.starbucks.com/menu/drinks"))

		drinks_doc = doc.css(".container")
		main_drink_content = drinks_doc.css(".main_content")
		main_drink_content.css("li").each do |drink|
			if drink.css("h2").text != ""
				CoffeeScraper::CoffeeType.new(drink.css("h2").text,drink.css("a")[0]["href"] )
			end
		end
   		#end
   		scrape_coffees
	end

	def self.scrape_coffees
		CoffeeScraper::CoffeeType.all.each do |coffee_type|
		doc = Nokogiri::HTML(open("https://www.starbucks.com"+ coffee_type.url))

   			submenu_drinks_doc = doc.css(".category")
   			submenu_drink_content = submenu_drinks_doc.css(".drinks")
   			submenu_drink_content.css("li").each do |sub_drink|
				if sub_drink.css("span").text != ""

					coffee_type.coffees << CoffeeScraper::Coffee.new(sub_drink.css("span").text, sub_drink.css("a")[0]["href"]) 

				end
   			end
   		end
	end
end

# main url "https://www.starbucks.com/menu/drinks"
