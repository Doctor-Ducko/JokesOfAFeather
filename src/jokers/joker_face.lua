SMODS.Joker {
	key = 'joker_face',			-- Object ID, acessed with j_joaf_[key]
	atlas = 'JOAFJokers',		-- Spritesheet to use, initalized in main script
	pos = {x = 2, y = 1},		-- works on a +1 increment, not based off of pixels
	rarity = 2,					-- 1-Common | 2-Uncommon | 3-Rare | 4-Legendary, string id for modded rarities, found in main script
	cost = 6,					-- shop price

	blueprint_compat = true,	-- Cosmetic only, define in calculate function
	eternal_compat = true,		-- Self Explanatory
	perishable_compat = true,

	unlocked = true,			-- Do not change these, they make the jokers visible on mod download
	discovered = false,

	-- Display text
	loc_txt = {
		name = 'Joker Face',
		text = {
			"When round begins,",
			"add a random {C:attention}face card{}",
			"to your hand",
		}
	},

	-- Variables used in loc_vars and calculate
	config = {
		extra = {

		}
	},
	-- Variables to be used in the loc_txt area
	loc_vars = function(self, info_queue, card)
		return {
			vars = {
				--card.ability.extra.variable_name
			}
		}
	end,

	-- look at wiki for info i aint writing it down here
	calculate = function(self, card, context)
		if context.first_hand_drawn then
			G.E_MANAGER:add_event(Event({
				func = function() 
					local _card = create_playing_card({
						front = pseudorandom_element(P_FACE_CARDS), 
						center = G.P_CENTERS.c_base}, G.hand, nil, nil, {G.C.SECONDARY_SET.Enhanced})
					G.GAME.blind:debuff_card(_card)
					G.hand:sort()
					return true
				end}))
			playing_card_joker_effects({true})
			return {}
		end
	end
}