SMODS.Back{
    key = "tinkerers",                  -- Object id, acessed with b_joaf_[key]
	atlas = 'JOAFDecks',                -- Atlas to use, do not change
    pos = {x = 2, y = 0},               -- pos on atlas
    
    loc_txt = {
        name = "Tinkerer's Deck",
        text ={
            "Start with a {C:attention}Tinkerer Joker",
            "{C:attention}+2{} consumable slots"
        },
    },

    config = {
        consumable_slot = 2
    },

	apply = function(self, back)
		delay(0.4)
		G.E_MANAGER:add_event(Event({
			func = function()
				local card = create_card("Joker", G.jokers, nil, nil, nil, nil, "j_joaf_tinkerer_joker", "deck")
				--card:set_eternal(true)
				card:add_to_deck()
				G.jokers:emplace(card)
				card:start_materialize()
				return true
			end,
		}))
	end
}