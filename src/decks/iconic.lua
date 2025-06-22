SMODS.Back{
    key = "iconic",
	atlas = 'JOAFDecks',
    pos = {x = 4, y = 0},
    loc_txt = {
        name = "Iconic Deck",
        text ={
            "Start with a random",
			"{C:legendary,E:1}Legendary {C:attention}J.O.A.F. Joker"
        },
    },
	apply = function(self, back)
		delay(0.4)
		G.E_MANAGER:add_event(Event({
			func = function()
				local card = create_card("Joker", G.jokers, nil, nil, nil, nil, "j_joaf_" .. JOAF.joaf_legendaries[math.random(1,#JOAF.joaf_legendaries)], "deck")
				card:add_to_deck()
				G.jokers:emplace(card)
				card:start_materialize()
				return true
			end,
		}))
	end
}