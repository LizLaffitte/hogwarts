class CLI

    def call
        puts "Welcome, young wizard. When I call your name, you will come forth."
        sleep 1
        puts "I shall place the sorting hat on your head. And you will be sorted into your houses."
        sleep 1
        puts "Ah, right then..."
        sleep 1
        puts "Hmm...difficult, very difficult..."
        puts "Where to put you?"
        Api.new.houses
        list_houses
        input_house = gets.chomp.downcase
        puts "Excellent! Ten points to #{input_house.capitalize}!"
        puts "To learn more about your house, enter 'house info'."
        puts "To see what other students are in your house, enter 'housemates'."
        puts "To cast a spell, enter 'spells'."
        puts "To change your house, enter 'change house'."
        input = gets.chomp.downcase
        case input
        when "house info"
        when "housemates"
        when "spells"
        when "change house"
        end
    end

    def list_houses
        House.all.sort_by(&:name).each.with_index(1){|house, idx| puts "#{idx}. #{house.name}"}
    end


end