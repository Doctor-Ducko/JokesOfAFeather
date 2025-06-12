SMODS.Back{
    key = "family",
	atlas = 'JOAFDecks',
    pos = {x = 0, y = 0},
    config = {
        family_rate_multiplier = 10
	},
    loc_txt = {
        name = "Family Deck",
        text ={
			"{C:joaf_family}Family Guy {C:attention}Jokers{} are",
            "{C:attention}#1#X{} more likely to appear"
        },
    },
	loc_vars = function(self, info_queue, card)
        return {
			vars = {
                self.config.family_rate_multiplier
			}
		}
    end,
	apply = function(self, back)
		G.GAME['joaf_family_mod'] = G.GAME['joaf_family_mod'] * self.config.family_rate_multiplier
	end
}