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
        sleep 2
        user_house
        @your_api_instance.houses
        input = nil
        while input != "Exit" 
            list_houses

            input = gets.chomp.capitalize
            if House.find_house(input) == nil
                puts "Have you been confunded? Try again."
            else 
                house_info(input)
                input = menu_options(input)
                if input.downcase == "classmates"
                    list_classmates(input)
                end
            end
        end
    end

    def user_house
        @your_api_instance = Api.new
        @user_house = @your_api_instance.sorting_hat
        puts "#{@user_house}!"
        sleep 1
    end


    def list_houses
        puts "There are four houses at the Hogwarts School of Witchcraft and Wizardry."
        puts "Enter the name of a house to learn more about it,"
        puts "or enter 'exit' to leave Hogwarts."
        House.all.sort_by(&:name).each.with_index(1){|house, idx| puts "#{idx}. #{house.name}"}
    end

    def list_classmates(house)
        puts "classmates"
    end

    def house_info(house)
        my_house = House.find_house(house)
        my_house.list_house_info
    end

    def menu_options(house)
        puts "Where to now, wizard?"
        puts "Enter 'houses' to see the list of Hogwart's houses,"
        puts "or enter 'classmates' to see a list of students in #{house.capitalize}."
        input = gets.chomp
    end


end