class CocktailsApp::Scraper
   

    def self.scrape
        doc = Nokogiri::HTML(open('https://www.bitememore.com/read/296/top-10--refreshing-summer-cocktails'))
        cocktail_list = []
        
        doc.css(".blog-image-full").each do |c|
            cocktails = {}
            cocktail = c.css("h2").text.split
            cocktail.shift
            cocktails[:name] = cocktail.join(" ")
            cocktails[:description] = c.children[1].text
            cocktails[:recipe_url] = c.css("a").attribute("href").value
            cocktail_list << cocktails
        end
        cocktail_list
    end

    def self.scrape_recipe(cocktail_url)
        doc = Nokogiri::HTML(open(cocktail_url))
        cocktail_ingredients = doc.css()
        binding.pry
    end
end
