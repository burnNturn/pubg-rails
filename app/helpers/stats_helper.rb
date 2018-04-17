MATCH_SEARCH_PARAMS = {
    'platform': {
        'pc': 'PC',
        'xbox': 'Xbox'
    },
    'region': {
        'as': 'Asia',
        'eu': 'Europe',
        'na': 'North America',
        'oc': 'Oceania',
        'krjp': 'Korea',
        'jp': 'Japan',
        'kakao': 'Kakao',
        'sea': 'South East Asia',
        'sa': 'South and Central America'
    }
}

MATCH_TYPE = {
    'solo-fpp': "Solo - First Person",
    'solo-tpp': "Solo - Third Person",
    'duo-fpp': "Duo - First Person",
    'duo-tpp': "Dup - Third Person",
    'squad-fpp': "Squad - First Person",
    'squad-tpp': "Squad - Third Person"
}

module StatsHelper
    def self.find_participant(rosters, ign)
        rosters.each do |roster|
            roster.participants.each do |participant|
                if participant.name == ign
                    return participant
                end
            end
        end
    end

    def self.build_select_opts(opts={})
        options_string = ''
        MATCH_SEARCH_PARAMS[opts[:key].to_sym].each_key do |key|
            options_string << "<option>#{MATCH_SEARCH_PARAMS[opts[:key].to_sym][key]}</option>"
        end
        options_string
    end
    
    def self.friendly_duration_time(duration)
        (duration / 60).to_i.to_s + ":" + (duration % 60).to_s
    end
    
    def self.friendly_match_type(type)
        return MATCH_TYPE[type.to_sym] if MATCH_TYPE[type.to_sym]
        "Event Game Mode (#{type})"
    end
end
