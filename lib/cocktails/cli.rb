class CocktailsApp::Cli    
    def run
        cocktail_list = CocktailsApp::Scraper.scrape
        CocktailsApp::CocktailList.create_from_collection(cocktail_list)
        puts "Welcome to the Summer Cocktail App"
        menu
    end

    def menu
        puts "Would you like to view a list of our Top 10 Summer Cocktails?"
        puts "Type 'Y' to view the list of cocktails"
        puts "Type 'exit' to exit the program"

        input = gets.chomp
        if input == "exit"
            goodbye
            exit
        elsif input == "y"
            list_cocktails_list
            submenu
        else
            # invalid command
            menu
        end
    end

    def list_cocktails_list
        CocktailsApp::CocktailList.all.each.with_index(1) do |cocktails, index|
            puts "#{index}. #{cocktails.name}"
        end
    end

    def submenu
        puts "To view description of each cocktail, please enter a number"
        puts "To exit, please type 'exit'"

        input = gets.chomp
        if input == "exit"
            goodbye
            exit
        elsif input.to_i.between?(1, CocktailsApp::CocktailList.all.length)
            cocktail = CocktailsApp::CocktailList.all[input.to_i - 1]
            recipe = CocktailsApp::Scraper.scrape_recipe(cocktail.recipe_url)
            print_cocktail_details(cocktail)
            recipe_menu
        else
            invalid_command
            submenu
        end
    end

    def print_cocktail_details(cocktails)
        puts "********************************"
        puts "       #{cocktails.name}        "
        puts "********************************"
        puts ""
        puts "#{cocktails.description}"
        puts ""
    end

    def recipe_menu
        puts "Would you like to learn how to make this?"
        puts ""

        input = gets.chomp

        if input == "exit"
            goodbye
            exit
        # elsif input == "y" 
        #     cocktails = CocktailsApp::CocktailList.all[input.to_i - 1]
        #     print_cocktail_details(cocktails)
        #     recipe_menu
        else
            invalid_command
            submenu
        end

        def recipe_run

        end

    end

    def goodbye
        puts "Happy drinking and drink responsibly!"
    end
end