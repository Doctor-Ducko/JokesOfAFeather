SMODS.Back{
    key = "polydactyls",                  -- Object id, acessed with b_joaf_[key]
	atlas = 'JOAFDecks',                -- Atlas to use, do not change
    pos = {x = 0, y = 1},               -- pos on atlas
    
    loc_txt = {
        name = "Polydactyl's Deck",
        text ={
            "{C:attention}+#1#{} Card Selection limit",
            "{C:attention}+#2#{} hand size",
            "{C:red}#3#X{} base Blind size"
        },
    },

    config = {
        selection_limit = 2,
        hand_size = 2,
        ante_scaling = 1.5
    },

	loc_vars = function(self)
        return { vars = {
            self.config.selection_limit,
            self.config.hand_size,
            self.config.ante_scaling
            }
        }
    end,

    apply = function(self)
        G.E_MANAGER:add_event(Event({
            trigger = "immediate", 
            func = function()
                SMODS.change_play_limit(self.config.selection_limit)
                SMODS.change_discard_limit(self.config.selection_limit)
                return true
            end
        }))
    end
}