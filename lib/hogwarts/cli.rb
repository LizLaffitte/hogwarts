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
        @selection = "Houses"
        while @selection != "Exit"
            case @selection
            when "Houses"
                list_houses
            when "Classmates"
                list_classmates(@selected_house)
            when "Gryffindor", "Slytherin", "Hufflepuff", "Ravenclaw"
                house_info(@selection)
                @selected_house = House.find_house(@selection)
                @selected_house.add_students
                puts "Where to now, wizard?"
                puts "Enter 'houses' to see the list of Hogwart's houses,"
                puts "or enter 'classmates' to see a list of students in #{@selection}."
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
        house.list_students
        puts "Where to now, wizard?"
        puts "Enter a student's name to learn more about them,"
        puts "or enter 'houses' to see the list of Hogwart's houses,"
    end

    def house_info(house)
        my_house = House.find_house(house)
        my_house.list_house_info
    end


end