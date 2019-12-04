class CLI

    def call
        puts "Welcome, young wizard." 
        sleep 1
        puts "When I call your name, you will come forth."
        sleep 1
        puts "I shall place the sorting hat on your head."
        sleep 1
        puts "And you will be sorted into your house."
        sleep 1
        puts "Ah, right then..."
        sleep 1
        puts "Hmm...difficult, very difficult..."
        sleep 1
        puts "Where to put you?"
        sleep 2
        user_house
        sleep 1
        @your_api_instance.houses
        @selection = nil
        while @selection != "Exit"
            puts "Where to now, wizard?"
            puts "Enter 'houses' to see the list of Hogwart's houses,"
            puts "enter 'students' to see a list of your fellow students,"
            puts "or enter 'exit' to leave Hogwarts."
            case @selection
            when "Houses"
                list_houses
            when "Gryffindor", "Slytherin", "Hufflepuff", "Ravenclaw"
                house_info(@selection)
                @selected_house = House.find_house(@selection)
                @selected_house.add_characters
            when "Members"
                list_characters(@selected_house)
                puts "Where to now, wizard?"
                puts "Enter a member's number (1-10) to learn more about them,"
                puts "or enter 'houses' to see the list of Hogwart's houses,"
            when "1", "2", "3", "4", "5", "6", "7", "8", "9", "10"
                @selected_house.characters[(@selection.to_i) - 1].character_info
                puts "Where to now, wizard?"
                puts "Enter 'houses' to see the list of Hogwart's houses,"
                puts "or enter 'members' to see a list of #{@selected_house.name} members."
            else
                puts "Have you been confunded? Try again."
            end
            @selection = gets.chomp.capitalize
        end
    end

    def user_house
        @your_api_instance = Api.new
        @user_house = @your_api_instance.sorting_hat
        puts "#{@user_house}!"
    end


    def list_houses
        puts "There are four houses at the Hogwarts School of Witchcraft and Wizardry."
        puts "Enter the number of a house to learn more about it,"
        puts "or enter 'exit' to leave Hogwarts."
        House.all.sort_by(&:name).each.with_index(1){|house, idx| puts "#{idx}. #{house.name}"}
        selected_house_index = (gets.chomp.to_i) - 1
        
        if House.all.length > selected_house_index && selected_house_index > -1
            house = House.all.sort_by(&:name)[selected_house_index]
            house.list_house_info

        end
    end

    def list_characters(house)
        puts "Members of #{house.name}:"
        if house.characters = []
            house.add_characters
        end
        house.print_character_list
    end

    def house_info(house)
        house.list_house_info
    end


end