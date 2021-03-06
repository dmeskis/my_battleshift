class GamesController < ApplicationController

  def new
    @users = User.all
  end

  def create
    conn.post "/api/v1/games", { :opponent_email => params[:email] }
  end
    
  def conn
    Faraday.new(url: ENV["ROOT_URL"]) do |faraday|
      faraday.headers['X-Api-Key'] = current_user.api_key
      faraday.request  :url_encoded
      faraday.response :logger
      faraday.adapter Faraday.default_adapter
     end
  end
end
