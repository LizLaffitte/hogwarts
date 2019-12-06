class Character
    attr_accessor :patronus, :wand, :boggart, :house, :ministryOfMagic, :orderOfThePhoenix, :dumbledoresArmy, :deathEater, :role
    attr_reader :id, :name
    @@all = []
    @@students = []

    def initialize(attributes)
        @id = attributes["_id"]
        @name = attributes["name"]
        @boggart = attributes["boggart"]
        @patronus = attributes["patronus"]
        @wand = attributes["wand"]
        @role = attributes["role"]
        @patronus = attributes["patronus"]
        @@all << self
        if @role == "student"
            @@students << self
        end
    end

    def self.all
        @@all
    end

    def self.students
        @@students
    end

    def character_info
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