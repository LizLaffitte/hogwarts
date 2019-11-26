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
        user_house
        puts "There are four houses at the Hogwarts School of Witchcraft and Wizardry."
        puts "Enter the name (or number) of a house to learn more about it,"
        puts "or enter 'exit' to leave Hogwarts."
        @your_api_instance.houses
        list_houses
        @input_house = gets.chomp.capitalize
        #puts "Excellent! Ten points to #{@user_house}!"
        sleep 2
        while input != "exit"
            input = list_top_menu_options
            case input
            when "house info"
                house_info
                puts "Where to now, brave young wizard?"
                input = gets.chomp
            when "change house"
                puts "change house"
            else
                "Have you been confunded? Try again."
            end
        end
    end

    def user_house
        @your_api_instance = Api.new
        @user_house = @your_api_instance.sorting_hat
        puts "#{@user_house}!"
        sleep 1
    end

    def list_top_menu_options
        puts "To learn more about your house, enter 'house info'."
        #puts "To see what other students are in your house, enter 'housemates'."
        #puts "To cast a spell, enter 'spells'."
        puts "To change your house, enter 'change house'."
        puts "To quit, type 'exit'."
        puts "What would you like to do?"    
        input = gets.chomp.downcase
    end

    def list_houses
        House.all.sort_by(&:name).each.with_index(1){|house, idx| puts "#{idx}. #{house.name}"}
    end

    def house_info
        my_house = House.find_house(@input_house)
        my_house.list_house_info

    end

end