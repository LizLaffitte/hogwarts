class House
    attr_accessor :name, :mascot, :_id, :headOfHouse, :houseGhost, :founder, :__v, :school, :members, :values, :colors, :students
    @@all = []

    def initialize(attributes)
        attributes.each do |key, value|
            self.send(("#{key}="), value)
        end
        @members = attributes.first(10)
        @students = []
        @@all << self
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

    def add_students
        @student_api_call = Api.new
        self.members.first(10).each do |student_id|
            student_hash = @student_api_call.student(student_id)
            student = Student.new(student_hash)
            student.house = self
            self.students << student
        end
    end

end