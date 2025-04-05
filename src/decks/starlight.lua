SMODS.Back{
    key = "starlight",                  -- Object id, acessed with b_joaf_[key]
	atlas = 'JOAFDecks',                -- Atlas to use, do not change
    pos = {x = 0, y = 0},               -- pos on atlas
    
    loc_txt = {
        name = "Starlight Deck",
        text ={
            "Start run with",
            "all {C:attention}Gold Cards{}",
            "Earn no {C:attention}Interest{}",
            "{C:inactive,s:0.9}(Credit: Chilli)",
        },
    },

    config = {
        no_interest = true,
    },

    apply = function()
        G.E_MANAGER:add_event(Event({
            func = function()
                for i = #G.playing_cards, 1, -1 do
                    G.playing_cards[i]:set_ability(G.P_CENTERS.m_gold)
                end
                return true
            end
        }))
    end
}