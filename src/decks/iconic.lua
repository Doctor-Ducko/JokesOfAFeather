SMODS.Back{
    key = "iconic",
	atlas = 'JOAFDecks',
    pos = {x = 4, y = 0},
    config = {
	},
    loc_txt = {
        name = "Iconic Deck",
        text ={
            "Start with a random",
			"{C:legendary,E:1}Legendary {C:attention}J.O.A.F. Joker"
        },
    },
	loc_vars = function(self, info_queue, card)
        return {
			vars = {
			}
		}
    end,
	apply = function(self, back)
		delay(0.4)
		G.E_MANAGER:add_event(Event({
			func = function()
				local cards = {
					"emperor",
					"flug",
					"money_smart",
				}

				local card = create_card("Joker", G.jokers, nil, nil, nil, nil, "j_joaf_" .. cards[math.random(1,#cards)], "deck")
				card:add_to_deck()
				G.jokers:emplace(card)
				card:start_materialize()
				return true
			end,
		}))
	end
}