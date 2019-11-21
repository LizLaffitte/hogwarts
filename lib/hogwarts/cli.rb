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
        house_selection = gets.chomp
    end

    def list_houses
        House.all.sort_by(&:name).each.with_index(1){|house, idx| puts "#{idx}. #{house.name}"}
    end


end