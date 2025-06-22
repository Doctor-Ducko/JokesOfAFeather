SMODS.Joker {
	key = "hands_of_steel",		-- Object ID, acessed with j_joaf_[key]
	atlas = "JOAFJokers",		-- Spritesheet to use, initalized in main script
	pos = {x = 7, y = 3},		-- works on a +1 increment, not based off of pixels
	rarity = 2,					-- 1-Common | 2-Uncommon | 3-Rare | 4-Legendary, string id for modded rarities, found in main script
	cost = 6,					-- shop price

	blueprint_compat = true,	-- Cosmetic only, define in calculate function
	eternal_compat = true,		-- Self Explanatory
	perishable_compat = true,

	unlocked = true,			-- Do not change these, they make the jokers visible on mod download
	discovered = false,

	-- Display text
	loc_txt = {
		name = "Hands of Steel",
		text = {
			"Scored {C:attention}Steel Cards{} give",
			"{X:chips,C:white}X#1#{} Chips"
		}
	},

	-- Variables used in loc_vars and calculate
	config = {
		extra = {
			x_chips = 1.5
		}
	},
	-- Variables to be used in the loc_txt area
	loc_vars = function(self, info_queue, card)
		info_queue[#info_queue+1] = G.P_CENTERS.m_steel
		return {
			vars = {
				card.ability.extra.x_chips
			}
		}
	end,

	-- look at wiki for info i aint writing it down here
	calculate = function(self, card, context)
		if context.individual and context.cardarea == G.play then
			if context.other_card.ability.effect == "Steel Card" then
				return {
					x_chips = card.ability.extra.x_chips
				}
			end
		end
	end
}