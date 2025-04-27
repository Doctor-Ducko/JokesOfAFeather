SMODS.Joker {
	key = 'lil_joker',			-- Object ID, acessed with j_joaf_[key]
	atlas = 'JOAFJokers',		-- Spritesheet to use, initalized in main script
	pixel_size = { w = 37, h = 49 },
	pos = {x = 7, y = 1},		-- works on a +1 increment, not based off of pixels
	rarity = 2,					-- 1-Common | 2-Uncommon | 3-Rare | 4-Legendary, string id for modded rarities, found in main script
	cost = 5,					-- shop price

	blueprint_compat = true,	-- Cosmetic only, define in calculate function
	eternal_compat = true,		-- Self Explanatory
	perishable_compat = true,

	unlocked = true,			-- Do not change these, they make the jokers visible on mod download
	discovered = true,

	-- Display text
	loc_txt = {
		name = "Lil' Joker",
		text = {
			"Scores the {C:chips}chips{} and {C:mult}Mult{}",
			"that {C:attention}High Card{} currently has"
		}
	},

	-- Variables used in loc_vars and calculate
	config = {
		extra = {
			chips = 5,
			mult = 1,
		}
	},
	-- Variables to be used in the loc_txt area
	loc_vars = function(self, info_queue, card)
		return {
			vars = {
				card.ability.extra.chips,
				card.ability.extra.mult,
			}
		}
	end,

	-- look at wiki for info i aint writing it down here
	calculate = function(self, card, context)
		if context.joker_main then
			card.ability.extra.chips = JOAF.get_poker_hand_stat("High Card", "chips")
			card.ability.extra.mult = JOAF.get_poker_hand_stat("High Card", "mult")
			return {
				chips = card.ability.extra.chips,
				mult = card.ability.extra.mult,
			}
		end
	end
}