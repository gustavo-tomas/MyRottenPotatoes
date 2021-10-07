class Movie < ActiveRecord::Base
    class Movie::InvalidKeyError < StandardError ; end 
    def self.find_in_tmdb(string)
        begin
            Tmdb::Movie.find(string)
        rescue Tmdb::InvalidApiKeyError
            raise Movie::InvalidKeyError, 'Invalid API key'
        end
    end
    def self.all_ratings
        ['G','PG','PG-13','R','NC-17']
    end
end