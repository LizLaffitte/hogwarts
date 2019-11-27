class Character
    attr_accessor :patronus, :wand, :house, :ministryOfMagic, :orderOfThePhoenix, :dumbledoresArmy, :deathEater, :bloodStatus, :species, :role, :date
    attr_reader :id, :name, :boggart
    @@all = []

    def initialize(attributes)
        @id = attributes["_id"]
        @name = attributes["name"]
        @boggart = attributes["boggart"]
        @house = attributes["house"]
        @patronus = attributes["patronus"]
        @wand = attributes["wand"]
        @@all << self
    end

    def self.all
        @@all
    end

    def character_info
        if self.patronus == nil
            self.patronus = "Unknown"
        elsif self.wand == nil
            self.wand = "Unknown"
        elsif self.boggart == nil
            self.boggart = "Unknown"
        end
        puts "Member: #{self.name}"
        puts "House: #{self.house.name}"
        puts "Status: #{self.role}"
        puts "Patronus: #{self.patronus}"
        puts "Boggart: #{self.boggart}"
    end
    
end