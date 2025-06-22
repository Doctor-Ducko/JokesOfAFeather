CardSleeves.Sleeve {
    key = "iconic",
    atlas = "JOAFSleeves",
    pos = {x = 4, y = 0},
	loc_vars = function(self)
        local key, vars
        if self.get_current_deck_key() == "b_joaf_iconic" then
            key = self.key .. "_alt"
        else
            key = self.key
        end
        return { key = key, vars = vars }
    end,
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