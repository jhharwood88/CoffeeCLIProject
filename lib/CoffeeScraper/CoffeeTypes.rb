class CoffeeScraper::CoffeeType

	attr_accessor :name, :url, :coffees

	@@all = []

	def initialize(name, url)
		@name = name
		@url = url
		@coffees = []
		@@all << self
	end

	def self.available_coffees
		@url_start = "https://www.starbucks.com"
		main_coffee_list = CoffeeScraper::Scraper.scrape_available_coffees("Top Menu", "#{@url_start}/menu/drinks")
		coffee_counter = 0
		main_coffee_list.each do |x|
			coffee_counter += 1
			puts "#{coffee_counter}: #{x[0]} #{x[1]}"
		end
		puts "\n"
		main_coffee_list
	end

	def self.all
		@@all
	end

end