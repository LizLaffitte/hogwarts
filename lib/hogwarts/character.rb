class Character
    attr_accessor :name, :patronus, :wand, :boggart, :house, :role
    @@all = []
    @@students = []

    def initialize(attributes)
        attributes.each do |key, value|
            self.send(("#{key}="), value)
        end
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
            unless inst_var == :@role || instance_variable_get(inst_var) == nil
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