SMODS.Joker {
	key = "ace_face",			-- Object ID, acessed with j_joaf_[key]
	atlas = "JOAFJokers",		-- Spritesheet to use, initalized in main script
	pos = {x = 0, y = 4},		-- works on a +1 increment, not based off of pixels
	rarity = 1,					-- 1-Common | 2-Uncommon | 3-Rare | 4-Legendary, string id for modded rarities, found in main script
	cost = 3,					-- shop price

	blueprint_compat = false,	-- Cosmetic only, define in calculate function
	eternal_compat = true,		-- Self Explanatory
	perishable_compat = true,

	unlocked = true,			-- Do not change these, they make the jokers visible on mod download
	discovered = false,

	-- Display text
	loc_txt = {
		name = "Ace Face",
		text = {
			"All {C:attention}Aces{} are",
			"considered {C:attention}face cards{}"
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
	end
}