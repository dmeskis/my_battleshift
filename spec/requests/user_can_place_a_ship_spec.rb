require 'rails_helper'

describe 'user can place a ship' do
  describe 'via the api' do
    it 'posts a ship payload and updates the board' do
      game = create(:game)
      ship_1_payload = {
        ship_size: 3,
        start_space: "A1",
        end_space: "A3"
      }.to_json

      post "/api/v1/games/#{game.id}/ships", params: {ship_size: 3,
                                                      start_space: "A1",
                                                      end_space: "A3"
                                                    }, headers: { "X-Api-Key" => game.challenger.api_key}
      expect(response.body).to include("Successfully placed ship with a size of 3")
    end
  end
end
