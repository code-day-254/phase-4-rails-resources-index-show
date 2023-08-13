class BirdsController < ApplicationController
    def index
        birds = Bird.all
        render json: birds
    end

    def create
        birds = Bird.create(name: params[:name], species: params[:species])
    end

    def show
        bird = Bird.find_by(id: params[:id])
        if bird
            render json: bird, status: :ok
        else
            render json: {error: "page_not_found"}, status: :not_found
        end
    end
    
end