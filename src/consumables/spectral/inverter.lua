SMODS.Consumable {
    set = "Spectral",
    key = "inverter",
	config = {
        max_highlighted = 1,
        extra = 'joaf_lucky',
    },

    hidden = true,
    soul_set = 'Trinkets',
    soul_rate = 0.01,

    loc_vars = function(self, info_queue)
        info_queue[#info_queue + 1] = G.P_CENTERS.e_negative
        return {}
    end,

    loc_txt = {
        name = 'Inverter',
        text = {
            "Apply {C:dark_edition}Negative{} to",
            "a selected {C:attention}Joker"
        }
    },

    cost = 4,
    atlas = "JOAFItems",
    pos = {x=5, y=1},

    can_use = function(self, card)
        local temp_pool = {}
        for k, v in pairs(G.jokers.cards) do
            if not v.edition then
                temp_pool[#temp_pool + 1] = v
            end
        end
        return next(temp_pool)
    end,

    use = function(card, area, copier)
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            func = function()
                G.jokers.highlighted[1].set_edition(G.jokers.highlighted[1], "e_negative")
                G.jokers:unhighlight_all()
                return true
            end
        }))
    end,
}