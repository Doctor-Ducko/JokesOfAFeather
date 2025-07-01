SMODS.Joker {
	key = "negative_nancy",			-- Object ID, acessed with j_joaf_[key]
	atlas = "JOAFJokers",		-- Spritesheet to use, initalized in main script
	pos = {x = 3, y = 5},		-- works on a +1 increment, not based off of pixels
	rarity = 3,					-- 1-Common | 2-Uncommon | 3-Rare | 4-Legendary, string id for modded rarities, found in main script
	cost = 9,					-- shop price
	pools = {
		["JOAFJokers"] = true
	},
	blueprint_compat = true,	-- Cosmetic only, define in calculate function
	eternal_compat = true,		-- Self Explanatory
	perishable_compat = true,

	unlocked = true,			-- Do not change these, they make the jokers visible on mod download
	discovered = false,

	-- Display text
	loc_txt = {
		name = "Negative Nancy",
		text = {
			"If {C:attention}first hand{} of round",
			"has only {C:attention}1{} card,",
			"apply {C:dark_edition}Negative{} to it",
		}
	},
	
	-- Variables to be used in the loc_txt area
	loc_vars = function(self, info_queue, card)
		info_queue[#info_queue+1] = { key = "e_negative_playing_card", set = "Edition", config = {extra = 1} }
	end,

	-- look at wiki for info i aint writing it down here
	calculate = function(self, card, context)
		if context.first_hand_drawn and not context.blueprint then
            local eval = function() return G.GAME.current_round.hands_played == 0 and not G.RESET_JIGGLES end
            juice_card_until(card, eval, true)
        end
		if context.before and context.main_eval and G.GAME.current_round.hands_played == 0 and #context.full_hand == 1 then
			G.E_MANAGER:add_event(Event({
				trigger = "after", 
				func = function ()
					context.full_hand[1].set_edition(context.full_hand[1], "e_negative")
					context.full_hand[1]:juice_up(0.3, 0.5)
					return true
				end
			}))
			return {
				message = "Negativized!",
				colour = G.C.DARK_EDITION
			}
		end
	end
}