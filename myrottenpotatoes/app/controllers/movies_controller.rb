class MoviesController < ApplicationController
    def index
        # filter ratings and set checkbox
        filter_ratings
        # order movies by params[:sort_by]
        @movies = Movie.order(params[:sort_by]).where(:rating => filter_ratings)
    end
    def filter_ratings
        @checked = {'G'=>true,'PG'=>true,'PG-13'=>true,'R'=>true,'NC-17'=>true}
        @all_ratings = ['G','PG','PG-13','R','NC-17']
        ratings = []
        if params[:ratings].present?
            @all_ratings.each do |r|
                @checked[r] = false
                params[:ratings].each do |key,value|
                    ratings.push key
                    @checked[key] = true
                end
            end
        else
            ratings = @all_ratings
        end
        # return movies provided by params[:ratings]
        ratings
    end
    def show
        id = params[:id] # retrieve movie ID from URI route
        @movie = Movie.find(id) # look up movie by unique ID
        # will render app / views / movies / show.html.haml by default
    end
    def new
        @movie = Movie.new
    end
    def create
        @movie = Movie.create!(movie_params)
        flash[:notice] = "#{@movie.title} was successfully created."
        redirect_to movies_path
    end
    def movie_params
        if params[:movie]
            params.require(:movie).permit(:title, :rating, :release_date)
        end
    end
    def edit
        @movie = Movie.find params[:id]
    end
    def update
        @movie = Movie.find params[:id]
        @movie.update(movie_params)
        flash[:notice] = "#{@movie.title} was successfully updated."
        redirect_to movie_path(@movie)
    end
    def destroy
        @movie = Movie.find(params[:id])
        @movie.destroy
        flash[:notice] = "Movie '#{@movie.title}' deleted."
        redirect_to movies_path
    end
    def sort_by
        @movies = Movie.order(:title)
    end
end    