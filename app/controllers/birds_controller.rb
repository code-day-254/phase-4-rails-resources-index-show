class BirdsController < ApplicationController
    def index
        birds = Bird.all
        render json: birds
    end

    def create
        bird = Bird.create(birds_params)
        render json: bird
    end

    def show
        bird = Bird.find_by(id: params[:id])
        if bird
            render json: bird, status: :ok
        else
            render json: {error: "page_not_found"}, status: :not_found
        end
    end

    private

    def birds_params
        params.permit(:name, :species)
    end
    
end