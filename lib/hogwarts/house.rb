class House
    attr_accessor :name, :mascot, :headOfHouse, :houseGhost, :founder, :school, :members, :values, :colors, :characters
    @@all = []

    def initialize(attributes)
        attributes.each do |key, value|
            self.send(("#{key}="), value)
        end
        @characters = []
        @@all << self
        @colors.collect{|color| color.strip!}
    end

    def self.all
        @@all
    end

    def self.find_house(house_name)
        all.find {|house| house.name == house_name}
    end

    def list_house_info
        puts "The House of #{self.name}:"
        puts "Head of House: #{self.headOfHouse}"
        puts "Founder: #{self.founder}"
        puts "Mascot: #{self.mascot.capitalize}"
        puts "House Ghost: #{self.houseGhost}"
        list_colors = self.colors.collect{|color| color.capitalize}.join(", ")
        puts "Colors: #{list_colors}"
        list_values = self.values.collect{|value| value.capitalize}.join(", ")
        puts "Values: #{list_values}"
    end

    def add_characters
        @character_api_call = Api.new
        self.members.first(10).each do |char_id|
            char_hash = @character_api_call.character(char_id)
            character = Character.new(char_hash)
                character.house = self
                self.characters << character
        end
    end

    def print_character_list
        self.characters.each.with_index(1) do |char_obj, value|
            puts "#{value}. #{char_obj.name}"
        end
    end

end