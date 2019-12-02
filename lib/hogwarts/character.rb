class Character
    attr_accessor :patronus, :wand, :boggart, :house, :ministryOfMagic, :orderOfThePhoenix, :dumbledoresArmy, :deathEater, :bloodStatus, :species, :role, :date
    attr_reader :id, :name
    @@all = []

    def initialize(attributes)
        @id = attributes["_id"]
        @name = attributes["name"]
        @boggart = attributes["boggart"]
        @patronus = attributes["patronus"]
        @wand = attributes["wand"]
        @role = attributes["role"]
        @@all << self
    end

    def self.all
        @@all
    end

    def character_info
        self.patronus ||= "Unknown"
        self.wand ||= "Unknown"
        self.boggart ||= "Unknown"
        self.role ||= "Unknown"
        puts "Member: #{@name}"
        puts "House: #{self.house.name}"
        puts "Status: #{@role.capitalize}"
        puts "Patronus: #{@patronus.capitalize}"
        puts "Boggart: #{@boggart.capitalize}"
        puts "Wand: #{@wand.capitalize}"
    end
    
end