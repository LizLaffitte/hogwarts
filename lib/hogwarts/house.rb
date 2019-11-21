class House
    attr_accessor :name, :mascot, :_id, :headOfHouse, :houseGhost, :founder, :__v, :school, :members, :values, :colors
    @@all = []
    def initialize(attributes)
        attributes.each do |key, value|
            self.send(("#{key}="), value)
            @@all << self
        end
    end
end