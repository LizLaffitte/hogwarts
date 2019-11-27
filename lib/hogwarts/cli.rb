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
        unless input == "Exit" #Unless the user types exit
            list_houses #Show a list of the houses and gives top menu instructions
            input = gets.chomp.capitalize #Get user input, capitalizes it
            if House.find_house(input) == nil && input != "Exit" #If the input isn't the name of a house object, and isn't exit
                puts "Have you been confunded? Try again." #Writes message to try again
            else  #Otherwise
                house_info(input) #Retrieves house info based on house name
                selected_house = House.find_house(input)
                selected_house.add_students
                input = menu_options(selected_house) #Shows second level menu options, asks for input again 
                if input.downcase == "classmates" #if user input is classmates
                    list_classmates(selected_house) #List classmates in house -- but input would be classmates so that doesn't quite work
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
        puts "Students in #{house.name}:"
        if house.students = []
            house.add_students
        end
        binding.pry
    end

    def house_info(house)
        my_house = House.find_house(house)
        my_house.list_house_info
    end

    def menu_options(house)
        puts "Where to now, wizard?"
        puts "Enter 'houses' to see the list of Hogwart's houses,"
        puts "or enter 'classmates' to see a list of students in #{house.name}."
        input = gets.chomp.capitalize
        input
    end


end