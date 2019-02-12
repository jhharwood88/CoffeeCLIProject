class CoffeeScraper::Cli
	
	attr_accessor  :submenu_coffees #, :coffees

	def start_menu
		CoffeeScraper::Scraper.scrape
		initial_greeting
		welcome_message
		menu_selection
		exit_message
	end

	def initial_greeting
		puts "Welcome to the Starbucks Coffee Selector!\n\n"
		#@coffees = CoffeeScraper::CoffeeType.all
	end

	# def fresh_brewed_coffees
	# 	@fresh_brewed_coffees = CoffeeScraper::Coffees.fresh_brewed_coffees
	# end

	# def espresso_beverages
	# 	@espresso_beverages = CoffeeScraper::Coffees.espresso_beverages
	# end

	# def frappuccino
	# 	@frappuccino = CoffeeScraper::Coffees.frappuccino
	# end	

	def available_coffees(menu_choice)
		coffee_counter = 0
		puts "\n"
		CoffeeScraper::CoffeeType.all[menu_choice-1].coffees.each do |x|
			coffee_counter += 1
			puts "#{coffee_counter}: #{x.name}"
		end
		puts "\n"
		puts "************END OF LIST************ \n"
	end

	def welcome_message
		ct_counter = 0
		puts "\n"
		CoffeeScraper::CoffeeType.all.each do |ct|
			ct_counter += 1
			puts "#{ct_counter}: #{ct.name}"
		end
		puts "\n"
		puts "Please chose from our list of drinks to begin. To relist drinks type list or exit to quit:\n"	
	end

	def check_string(string)
		string.scan(/\D/).empty?
	end

	def menu_selection

		menu_input = nil
		
		while menu_input != "exit"
			
			menu_input = gets.strip

			if check_string(menu_input) == true 
				menu_is_int = menu_input.to_i
				if menu_is_int > 0 && menu_is_int <= CoffeeScraper::CoffeeType.all.count
					 available_coffees(menu_is_int)
					 welcome_message
				else
					puts "Invalid respone, please enter your selection again"
				end
			# 	puts "#{fresh_brewed_coffees}"
			# 	puts "Please choose your style of drink. To relist drink types put list, put exit to quit:"
			# 	@submenu_input = gets.strip
			# 	submenu
			# 	@menu_input = "exit"  

			# elsif @menu_input == "2"
			# 	puts "#{espresso_beverages}"
			# 	puts "Please choose your style of drink. To relist drink types put list, put exit to quit:"
			# 	@submenu_input = gets.strip
			# 	submenu
			# 	@menu_input = "exit" 

			# elsif @menu_input == "3"
			# 	puts "#{frappuccino}"
			# 	puts "Please choose your style of drink. To relist drink types put list, put exit to quit:"
			# 	@submenu_input = gets.strip
			# 	submenu
			# 	@menu_input = "exit" 

			elsif menu_input == "list"
				welcome_message

			elsif menu_input == "exit"
				#to allow for exit input
			else
				puts "Invalid respone, please enter your selection again"
			end
		end
	end

	# def submenu
		
	# 	while @submenu_input != "exit"
			
	# 		if @submenu_input == "1"
	# 				puts "Info on drink 1"
	# 				@submenu_input = gets.strip

	# 		elsif @submenu_input == "2"
	# 				puts "Info on drink 2"
	# 				@submenu_input = gets.strip

	# 		elsif @submenu_input == "3"
	# 				puts "Info on drink 3"
	# 				@submenu_input = gets.strip

	# 		elsif @submenu_input == "4"
	# 				puts "Info on drink 4"
	# 				@submenu_input = gets.strip

	# 		elsif @submenu_input == "5"
	# 				puts "Info on drink 5"
	# 				@submenu_input = gets.strip

	# 		elsif @submenu_input == "list"
	# 			coffee_list
	# 			menu_selection

	# 		elsif @submenu_input == "exit"

	# 		else
	# 			puts "Invalid respone, please enter your selection again"
	# 			@submenu_input = gets.strip
	# 		end
	# 	end
	# end

	def exit_message
		puts "Thanks for using Coffee Selector, have a great day!"
	end

end
