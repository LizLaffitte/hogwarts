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
        @your_api_instance.houses
        House.all.each{|house| house.add_characters}
        @selection = "Back"
        while @selection != "Exit"
            puts "Where to now, wizard?"
            puts "Enter 'houses' to see the list of Hogwart's houses,"
            puts "enter 'students' to see a list of your fellow students,"
            puts "or enter 'exit' to leave Hogwarts."
            @selection = gets.chomp.capitalize
            case @selection
            when "Back"
            when "Houses"
                list_houses
            when "Students"
                list_characters(@selected_house)
                puts "Where to now, wizard?"
                puts "Enter a member's number (1-10) to learn more about them,"
                puts "or enter 'houses' to see the list of Hogwart's houses,"
            # when "1", "2", "3", "4", "5", "6", "7", "8", "9", "10"
            #     @selected_house.characters[(@selection.to_i) - 1].character_info
            #     puts "Where to now, wizard?"
            #     puts "Enter 'houses' to see the list of Hogwart's houses,"
            #     puts "or enter 'members' to see a list of #{@selected_house.name} members."
            else
                puts "Have you been confunded? Try again."
            end
            
        end
    end

    def user_house
        @your_api_instance = Api.new
        @user_house = @your_api_instance.sorting_hat
        puts "#{@user_house}!"
    end


    def list_houses
        puts "There are four houses at the Hogwarts School of Witchcraft and Wizardry."
        user_input = nil
        while user_input != "Exit"
            puts "Enter the number of a house to learn more about it,"
            puts "or enter 'exit' to leave Hogwarts."
            House.all.sort_by(&:name).each.with_index(1){|house, idx| puts "#{idx}. #{house.name}"}
            user_input = gets.chomp.capitalize
            house_index = (user_input.to_i) - 1
            if user_input == "Break"
                break
            elsif House.all.length > house_index && house_index > -1
                house = House.all.sort_by(&:name)[house_index]
                house.list_house_info
            else 
                puts "Have you been confunded? Try again."
            end
        end
        if user_input == "Exit"
            @selection = "Exit"
        end
    end

    def list_random_students
        puts "Here are some of your fellow students:"
        Character.students.sample(10).with_index(1) do |student, idx| 
            puts "#{idx}. #{student.name}"
        end
    end


end