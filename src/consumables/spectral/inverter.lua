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
            "a selected {C:attention}Joker",
            "{C:attention}Can override current edition"
        }
    },

    cost = 4,
    atlas = "JOAFItems",
    pos = {x=5, y=1},

    can_use = function(self, card)
        if #G.jokers.highlighted == 1 then
            if not G.jokers.highlighted[1].edition then -- Jokers with no edition
                return true
            elseif G.jokers.highlighted[1].edition.key == "e_negative" then -- negative
                return false
            else -- jokers with an edition
                return true
            end
        end
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