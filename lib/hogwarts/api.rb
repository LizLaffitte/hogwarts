class Api
    @@token = "key=$2a$10$fo/wEo9.dGM7X1yW.2vcEeJwRd3bV8GgCiUSxwDUYyY5VjoUNEfvm"
    @@base_route = "https://www.potterapi.com/v1/"

    def sorting_hat
        HTTParty.get(@@base_route + "sortingHat").chomp('"')
    end

    def houses
        houses =  HTTParty.get(@@base_route + "houses?" + @@token)
        houses.collect do |house_hash| 
            house_hash.delete("_id")
            house_hash.delete("__v")
            House.new(house_hash)
        end
    end

    def character(id)
        orig_char_hash = HTTParty.get(@@base_route + "characters/" + id + "/?" + @@token)
        new_char_hash = orig_char_hash.to_h.slice("name", "role", "boggart", "wand", "patronus", "species")  
        if new_char_hash["role"] == "student"
            Character.new(new_char_hash)
        end
    end

end