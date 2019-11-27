class Api

    def initialize
        @base_route = "https://www.potterapi.com/v1/"
        @token = "key=$2a$10$fo/wEo9.dGM7X1yW.2vcEeJwRd3bV8GgCiUSxwDUYyY5VjoUNEfvm"
    end

    def sorting_hat
        HTTParty.get(@base_route + "sortingHat").chomp('"')
    end

    def houses
        houses =  HTTParty.get(@base_route + "houses?" + @token)
        houses.each{|house_hash| House.new(house_hash)}
    end

    def student(id)
        student =  HTTParty.get(@base_route + "characters/" + id + "/?" + @token)
    end


end