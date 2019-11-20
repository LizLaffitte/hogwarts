class CLI

    def call
        puts "Welcome, young wizard."
        sleep 2
        puts "When I call your name, you will come forth."
        sleep 2
        puts "I shall place the sorting hat on your head."
        sleep 2
        puts "And you will be sorted into your houses."
        sleep 2
        puts "Ah, right then..."
        Api.new.random_house
    end

end