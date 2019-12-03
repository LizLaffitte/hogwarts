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
        #Only want to display an attribute if it has been defined & isn't unknown.
        #self.patronus ||= "Unknown"
        # self.wand ||= "Unknown"
        # self.boggart ||= "Unknown"
        # self.role ||= "Unknown"
        # puts "Member: #{@name}"
        # puts "House: #{self.house.name}"
        # puts "Status: #{@role.capitalize}"
        # puts "Patronus: #{@patronus.capitalize}"
        # puts "Boggart: #{@boggart.capitalize}"
        # puts "Wand: #{@wand.capitalize}"
        self.instance_variables.each do |inst_var| 
            unless inst_var == :@id || instance_variable_get(inst_var) == nil
                characteristic = inst_var.to_s.gsub("@", "").capitalize + ": "
                if inst_var == :@house
                    characteristic += "#{self.house.name}"
                else
                characteristic += instance_variable_get(inst_var).to_s
                end
                puts characteristic
            end
        end
    end
    
end