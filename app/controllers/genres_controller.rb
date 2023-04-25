class GenresController < ApplicationController
    def index
        @genres = Genre.all
    end

    def new
        @genre = Genre.new
    end

    def show
        @genre = Genre.find(params[:id])
        @movies = Movie.where(director_id: @genre.id)
    end

    def create
        @genre = Genre.new(name: params[:genre][:name])
        if @genre.save
            flash[:notice] = 'Genre was successfully created.'
            return redirect_to genre_path(@genre.id)
        else
            render :new
        end
    end

    def edit
        @genre = Genre.find(params[:id])
    end

    def update
        @genre = Genre.find(params[:id])
        if @genre.update(name: params[:genre][:name])
            flash[:notice] = 'Genre was successfully updated.'
            return redirect_to genre_path(@genre.id)
        else
            render :edit
        end
    end
end
