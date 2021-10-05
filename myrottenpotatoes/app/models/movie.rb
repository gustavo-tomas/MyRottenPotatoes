class Movie < ActiveRecord::Base
    def self.all_ratings
        ['G','PG','PG-13','R','NC-17']
    end
    def self.find_in_tmdb(movie)
    end
end