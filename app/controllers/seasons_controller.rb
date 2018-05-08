class SeasonsController < ApplicationController
    def change_season
        byebug
        @season = Season.find_by_player_id_and_game_mode(params[:player_id].to_i, GAME_MODES.key(params[:new_game_mode]).to_s)
    end
end