class TelemetryWorker
  include Sidekiq::Worker

  def perform(tel_link, ign)
    telemetry_data = TelemetryWorker.get_telelemtry_data(tel_link)

    log_player_take_damage_events = []
    telemetry_data.each { |k| log_player_take_damage_events << k if k[:_T] == "LogPlayerTakeDamage" }

    ign_events = []

    # Duplicate logic is needed here because the data for Xbox and PC are different 
    # when it comes to keys for accessing the data.
    begin
      log_player_take_damage_events.each { |k| ign_events << k if k[:Attacker][:Name] == ign }
      
      weapon_dmg_dict = {}
      ign_events.each do |event|
        if weapon_dmg_dict.key? event[:DamageCauserName]
          weapon_dmg_dict[event[:DamageCauserName]] += event[:Damage]
        else
          weapon_dmg_dict[event[:DamageCauserName]] = event[:Damage]
        end
      end
    rescue
      log_player_take_damage_events.each { |k| ign_events << k if k[:attacker][:name] == ign }
      
      weapon_dmg_dict = {}
      ign_events.each do |event|
        if weapon_dmg_dict.key? event[:damageCauserName]
          weapon_dmg_dict[event[:damageCauserName]] += event[:damage]
        else
          weapon_dmg_dict[event[:damageCauserName]] = event[:damage]
        end
      end
    end

    Participant.find_by(
      match: Match.find_by_telemetry_link(tel_link),
      player: Player.find_by_name(ign)
    ).update(preferred_weapon: weapon_dmg_dict.sort[0][0]) unless weapon_dmg_dict.empty?
  end
  
  def self.get_telelemtry_data(tel_link)
    uri = URI(tel_link)
    req = Net::HTTP::Get.new(uri)
    req["Api-Key"] = Rails.application.secrets.PUBG_SECRET
  
    res = Net::HTTP.start(uri.hostname) {|http|
      http.request(req)
    }

    JSON.parse res.body, symbolize_names: true
  end
end
