SMODS.Back{
    key = "family",
	atlas = 'JOAFDecks',
    pos = {x = 0, y = 0},
    config = {
		hands = -2,
		discards = -1,
		joker_slot = -1,
		ante_scaling = 8,
		no_interest = true,
	},
    loc_txt = {
        name = "Family Deck",
        text ={
            "{s:0.9}Start with all",
			"{s:0.9}{C:attention}Eternal Family Jokers{},",
			"{s:0.9}{C:attention}#3#{} Joker Slot",
			"{s:0.9}{C:blue}#1#{} hands, {C:red}#2#{} discard",
			"{s:0.9}{C:red}X#4#{} base Blind size",
            "{s:0.9}Earn no {C:attention}Interest{}",
        },
    },
	loc_vars = function(self, info_queue, card)
        return {
			vars = {
				self.config.hands,
				self.config.discards,
				self.config.joker_slot,
				self.config.ante_scaling,
			}
		}
    end,
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