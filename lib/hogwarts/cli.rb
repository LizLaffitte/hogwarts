class CLI

    def call
        puts "Welcome, young wizard." 
        sleep 1
        puts "When I call your name, you will come forth."
        sleep 1
        puts "I shall place the sorting hat on your head."
        sleep 1
        puts "And you will be sorted into your houses."
        sleep 1
        puts "Ah, right then..."
        sleep 1
        puts "Hmm...difficult, very difficult..."
        puts "Where to put you?"
        Api.new.houses
        list_houses
        @input_house = gets.chomp.capitalize
        puts "Excellent! Ten points to #{@input_house}!"
        sleep 2
        input = nil
        while input != "exit"
            input = list_menu_options
            case input
            when "house info"
                house_info
            when "housemates"
                puts "Fellow #{input_house.capitalize}"
            when "spells"
                puts "spells"
            when "change house"
                puts "change house"
            else
                "Have you been confunded? Try again."
            end
        end
    end

    def list_menu_options
        puts "To learn more about your house, enter 'house info'."
        puts "To see what other students are in your house, enter 'housemates'."
        puts "To cast a spell, enter 'spells'."
        puts "To change your house, enter 'change house'."
        puts "To quit, type 'exit'."
        puts "What would you like to do?"    
        input = gets.chomp.downcase
    end

    def list_houses
        House.all.sort_by(&:name).each.with_index(1){|house, idx| puts "#{idx}. #{house.name}"}
    end

    def house_info
        #binding.pry
        my_house = House.find_house(@input_house)
        my_house.list_house_info
        puts "Where to now, brave young wizard?"
    end

end