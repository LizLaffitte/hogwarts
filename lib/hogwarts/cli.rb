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
        @selection = "back"
        while @selection != "exit"
            puts "Where to now, wizard?"
            puts "Enter 'houses' to see the list of Hogwart's houses,"
            puts "enter 'students' to see a list of your fellow students,"
            puts "or enter 'exit' to leave Hogwarts."
            @selection = gets.chomp.downcase
            case @selection
            when "back"
            when "houses"
                list_houses
            when "students"
                list_random_students
                @student_selection = gets.chomp.downcase
                puts "Where to now, wizard?"
                puts "Enter a member's number (1-10) to learn more about them,"
                puts "enter 'back' to go back,"
                puts "or enter 'exit' to leave Hogwarts"
            when "exit"
                break
            else
                puts "Have you been confunded? Try again. outer"
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
        while user_input != "exit"
            puts "Enter the number of a house to learn more about it,"
            puts "enter 'back' to go back,"
            puts "or enter 'exit' to leave Hogwarts."
            House.all.sort_by(&:name).each.with_index(1){|house, idx| puts "#{idx}. #{house.name}"}
            user_input = gets.chomp.downcase
            house_index = (user_input.to_i) - 1
            if user_input == "back"
                break
            elsif user_input == "exit"
                @selection = "exit"
                break
            elsif House.all.length > house_index && house_index > -1
                house = House.all.sort_by(&:name)[house_index]
                house.list_house_info
            else 
                puts "Have you been confunded? Try again."
            end
        end
    end

    def list_random_students
        puts "Here are some of your fellow students:"
        Character.students.sample(10).each.with_index(1) do |student, idx| 
            puts "#{idx}. #{student.name}"
        end
    end


end