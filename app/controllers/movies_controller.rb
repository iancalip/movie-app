class MoviesController < ApplicationController
    def new
        @movie = Movie.new
    end

    def show
        @movie = Movie.find(params[:id])
        @director = @movie.director
        @genre = @movie.genre
    end

    def edit
        @movie = Movie.find(params[:id])
    end

    def create
        @movie = Movie.new(movie_params)
        if @movie.save
            flash[:notice] = 'Movie was successfully created.'
            redirect_to root_path
        else
            flash.now[:notice] = 'Preencha todos os campos corretamente'
            render :new
        end
    end

    def update
        @movie = Movie.find(params[:id])
        if @movie.update(movie_params)
            flash[:notice] = 'Movie was successfully updated.'
            redirect_to @movie
        else
            flash.now[:notice] = 'Preencha todos os campos corretamente'
            render :edit, status: :unprocessable_entity
        end
    end

    private

    def movie_params
        params.require(:movie).permit(:title, :release_year, :synopsis, :nationality,
        :duration, :director_id, :genre_id, :image)
    end
end