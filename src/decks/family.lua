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
				local peter = create_card("Joker", G.jokers, nil, nil, nil, nil, "j_joaf_peter_griffin", "deck")
				local lois = create_card("Joker", G.jokers, nil, nil, nil, nil, "j_joaf_lois_griffin", "deck")
				local chris = create_card("Joker", G.jokers, nil, nil, nil, nil, "j_joaf_chris_griffin", "deck")
				local meg = create_card("Joker", G.jokers, nil, nil, nil, nil, "j_joaf_meg_griffin", "deck")
				local stewie = create_card("Joker", G.jokers, nil, nil, nil, nil, "j_joaf_stewie_griffin", "deck")
				local brian = create_card("Joker", G.jokers, nil, nil, nil, nil, "j_joaf_brian_griffin", "deck")

				peter:set_eternal(true)
				lois:set_eternal(true)
				chris:set_eternal(true)
				meg:set_eternal(true)
				stewie:set_eternal(true)
				brian:set_eternal(true)

				peter:add_to_deck()
				lois:add_to_deck()
				chris:add_to_deck()
				meg:add_to_deck()
				stewie:add_to_deck()
				brian:add_to_deck()

				G.jokers:emplace(peter)
				G.jokers:emplace(lois)
				G.jokers:emplace(chris)
				G.jokers:emplace(meg)
				G.jokers:emplace(stewie)
				G.jokers:emplace(brian)
				
				peter:start_materialize()
				lois:start_materialize()
				chris:start_materialize()
				meg:start_materialize()
				stewie:start_materialize()
				brian:start_materialize()
				return true
			end,
		}))
	end
}