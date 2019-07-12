class CocktailsApp::CocktailList
    attr_accessor :name, :description, :recipe_url
    @@all = []

    def initialize(attributes)
        #TODO
        attributes.each do |key, value|
            self.send("#{key}=", value)
        end
    end

    def self.create(attributes)
        cocktail = self.new(attributes)
        cocktail.save
        cocktail
    end

    def self.create_from_collection(array)
        #TODO
        array.each do |attributes|
        self.create(attributes)
        end
    end

    def self.all
        @@all
    end 

    def save
        self.class.all << self
    end
  


end