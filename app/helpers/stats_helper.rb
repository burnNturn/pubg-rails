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
end