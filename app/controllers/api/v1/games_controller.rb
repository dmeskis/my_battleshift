module Api
  module V1
    class GamesController < ActionController::API
      def show
        game = Game.find_by(id: params[:id])
        if game
          render json: game
        else
          render status: 400
        end
      end

      def create
        binding.pry
        game = Game.find_by(id: params[:id])
        render json: game
      end
    end
  end
end
