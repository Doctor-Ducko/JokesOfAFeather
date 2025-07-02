CardSleeves.Sleeve {
    key = "polydactyls",
    atlas = "JOAFSleeves",
    pos = {x = 0, y = 1},
	loc_vars = function(self)
        local key, vars
        if self.get_current_deck_key() == "b_joaf_polydactyls" then
            key = self.key .. "_alt"
            self.config = {
                selection_limit = 3,
                hand_size = 4,
                ante_scaling = 2.25
            }
        else
            key = self.key
            self.config = {
                selection_limit = 2,
                hand_size = 2,
                ante_scaling = 1.5
            }
        end
        vars = {
            self.config.selection_limit,
            self.config.hand_size,
            self.config.ante_scaling
        }
        return { key = key, vars = vars }
    end,
    apply = function(self, sleeve)
        G.E_MANAGER:add_event(Event({
            trigger = "immediate", 
            func = function()
                SMODS.change_play_limit(self.config.selection_limit)
                SMODS.change_discard_limit(self.config.selection_limit)
                return true
            end
        }))
        CardSleeves.Sleeve.apply(self, sleeve)
    end
}