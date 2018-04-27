require 'httparty'
require 'json'

class PlaysTv
    include HTTParty
    base_uri 'https://api.plays.tv/data/v1/'
    default_params @auth = { api_id: Rails.application.secrets.PLAYSTV_ID, api_key: Rails.application.secrets.PLAYSTV_KEY  }
    format :json

    def self.get_videos(user)
      url = PlaysTv::base_uri + "/videos/search?" + "appid=" + @auth[:api_id] + "&appkey=" + @auth[:api_key] + "&userId=" + user
      response = HTTParty.get(url)
    end
end