class DirectorsController < ApplicationController
    def index
        @directors = Director.all
    end

    def new
        @director = Director.new
    end

    def show
        @director = Director.find(params[:id])
        @movies = Movie.where(director_id: @director.id)
    end

    def create
        @director = Director.new(director_params)
        if @director.save
            flash[:notice] = 'Director was successfully created.'
            return redirect_to director_path(@director)
        else
            render :new
        end
    end

    def edit
        @director = Director.find(params[:id])
    end

    def update
        @director = Director.find(params[:id])
        if @director.update(director_params)
            flash[:notice] = 'Director was successfully updated.'
            redirect_to director_path(@director)
        else
            render :edit
        end
    end

    private

    def director_params
        params.require(:director).permit(:name, :nationality, :date_of_birth, :genre_id)
    end
end