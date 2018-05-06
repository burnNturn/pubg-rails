GAME_MODES = {
    "duo": "Duo - TPP",
    "duo-fpp": "Duo - FPP",
    "solo": "Solo - TPP",
    "solo-fpp": "Solo - FPP",
    "squad": "Squad - TPP",
    "squad-fpp": "Squad - FPP"
}

module SeasonsHelper
    def self.build_select_opts(opts={})
        options_string = ''
        opts[:game_modes].each do |game_mode|
            options_string << "<option>#{GAME_MODES[game_mode.to_sym]}</option>"
        end
        options_string
    end
end