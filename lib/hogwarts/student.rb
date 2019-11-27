class Student
    attr_accessor :_id, :name, :house, :school, :__v, :ministryOfMagic, :orderOfThePhoenix, :dumbledoresArmy, :deathEater, :bloodStatus, :species, :role, :date
        @@all = []
    def initialize(attributes)
        @id = attributes[:_id]
        @@all << self
    end
    
end