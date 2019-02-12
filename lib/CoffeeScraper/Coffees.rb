class CoffeeScraper::Coffee

	attr_accessor :name, :url_start

	@@all = []

	def initialize(name, url_start)
		@name = name
		@url_start = url_start
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
	def self.coffee_types
		
	end
	# def self.espresso_beverages
	# 	puts <<~HEREDOC

	# 		1:Caffe Americano
	# 		2:Caffe Latte
	# 		3:Caffe Mocha
	# 		4:Cappuccino 
	# 		5:Caramel Machiato
	# 	HEREDOC
	# end
	# def self.frappuccino
	# 	puts <<~HEREDOC

	# 		1:Black and White Mocha Crème Frappuccino
	# 		2:Caramel Brulée Crème Frappuccino
	# 		3:Coffee Frappuccino
	# 		4:Espresso Frappuccino
	# 		5:Mocha Frappuccino
	# 	HEREDOC
	# end

	
end
