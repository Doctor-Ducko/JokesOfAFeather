CardSleeves.Sleeve {
    key = "family",
    atlas = "JOAFSleeves",  -- you will need to create an atlas yourself
    pos = {x = 0, y = 0},
    config = {},
	loc_vars = function(self)
        local key, vars
        if self.get_current_deck_key() == "b_joaf_family" then
            key = self.key .. "_alt"
            self.config = {
                family_rate_multiplier = 1.5 -- Since we're already multiplying by 20 in the og deck
            }
        else
            key = self.key
            self.config = {
                family_rate_multiplier = 20
            }
        end
        vars = {
            self.config.family_rate_multiplier,
            self.config.family_rate_multiplier * 20,
        }
        return { key = key, vars = vars }
    end,
	apply = function(self, sleeve)
		G.GAME['joaf_family_mod'] = G.GAME['joaf_family_mod'] * self.config.family_rate_multiplier
	end
}