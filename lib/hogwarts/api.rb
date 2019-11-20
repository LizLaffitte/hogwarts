class Api

    def initialize
        @base_route = "https://www.potterapi.com/v1/"
        @token = "key=$2a$10$fo/wEo9.dGM7X1yW.2vcEeJwRd3bV8GgCiUSxwDUYyY5VjoUNEfvm"
    end

    def houses
        houses =  HTTParty.get(@base_route + "houses?" + @token)
        houses
    end

end