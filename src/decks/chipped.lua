SMODS.Back{
    key = "chipped",
	atlas = 'JOAFDecks',
    pos = {x = 0, y = 0},
    config = {},
    loc_txt = {
        name = "Chipped Deck",
        text ={
            "all cards are chipped"
        },
    },
    apply = function()
        G.E_MANAGER:add_event(Event({
            func = function()
                for i = #G.playing_cards, 1, -1 do
                    G.playing_cards[i]:set_ability("m_joaf_chipped")
                end
                return true
            end
        }))
    end
}