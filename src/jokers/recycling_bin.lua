SMODS.Joker {
	key = "recycling_bin",			-- Object ID, acessed with j_joaf_[key]
	atlas = "JOAFJokers",		-- Spritesheet to use, initalized in main script
	pos = {x = 3, y = 3},		-- works on a +1 increment, not based off of pixels
	rarity = 1,					-- 1-Common | 2-Uncommon | 3-Rare | 4-Legendary, string id for modded rarities, found in main script
	cost = 3,					-- shop price

	blueprint_compat = true,	-- Cosmetic only, define in calculate function
	eternal_compat = true,		-- Self Explanatory
	perishable_compat = true,

	unlocked = true,			-- Do not change these, they make the jokers visible on mod download
	discovered = true,

	-- Display text
	loc_txt = {
		name = "Recycling Bin",
		text = {
			"Gain {C:money}$#1#{} every #3#",
			"cards discarded",
			"{C:inactive}(#2# left)",
		}
	},

	-- Variables used in loc_vars and calculate
	config = {
		extra = {
			payout = 1,
			cards_left = 5,
			cards_required = 5,
		}
	},
	-- Variables to be used in the loc_txt area
	loc_vars = function(self, info_queue, card)
		return {
			vars = {
				card.ability.extra.payout,
				card.ability.extra.cards_left,
				card.ability.extra.cards_required,
			}
		}
	end,

	-- look at wiki for info i aint writing it down here
	calculate = function(self, card, context)
		if context.discard then
			card.ability.extra.cards_left = card.ability.extra.cards_left - 1
			if card.ability.extra.cards_left == 0 then
				card.ability.extra.cards_left = card.ability.extra.cards_required
				return {
					card = card,
					dollars = card.ability.extra.payout,
					colour = G.C.MONEY
				}
			end
		end
	end
}