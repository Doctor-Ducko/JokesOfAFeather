SMODS.Back{
    key = "family",
	atlas = 'JOAFDecks',
    pos = {x = 0, y = 0},
    config = { joker_slot = 1 },
    loc_txt = {
        name = "Family Deck",
        text ={
            "Start with all",
			"{C:attention}Eternal Family Jokers{}",
			"and {C:attention}+1{} Joker Slot"
        },
    },
	apply = function(self, back)
		delay(0.4)
		G.E_MANAGER:add_event(Event({
			func = function()
				-- someone please tell me if theres a better way to do this
				local cards = {
					"peter_griffin",
					"lois_griffin",
					"chris_griffin",
					"meg_griffin",
					"stewie_griffin",
					"brian_griffin",
				}

				for i,v in ipairs(cards) do
					local card = create_card("Joker", G.jokers, nil, nil, nil, nil, "j_joaf_" .. v, "deck")
					card:set_eternal(true)
					card:add_to_deck()
					G.jokers:emplace(card)
					card:start_materialize()
				end
				return true
			end,
		}))
	end
}