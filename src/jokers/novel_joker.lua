SMODS.Joker {
	key = 'novel_joker',			-- Object ID, acessed with j_joaf_[key]
	atlas = 'JOAFJokers',		-- Spritesheet to use, initalized in main script
	pos = {x = 8, y = 2},		-- works on a +1 increment, not based off of pixels
	rarity = 2,					-- 1-Common | 2-Uncommon | 3-Rare | 4-Legendary, string id for modded rarities, found in main script
	cost = 6,					-- shop price

	blueprint_compat = true,	-- Cosmetic only, define in calculate function
	eternal_compat = true,		-- Self Explanatory
	perishable_compat = true,

	unlocked = true,			-- Do not change these, they make the jokers visible on mod download
	discovered = false,

	-- Display text
	loc_txt = {
		name = 'Novel Joker',
		text = {
			"Scores {C:mult}+#1#{} Mult for",
			"every {C:uncommon}Uncommon{C:attention} Joker",
			"you have",
			"{C:inactive}(Including this Joker)"
		}
	},

	-- Variables used in loc_vars and calculate
	config = {
		extra = {
			mult_per = 7,
			mult = 7,
		}
	},
	-- Variables to be used in the loc_txt area
	loc_vars = function(self, info_queue, card)
		return {
			vars = {
				card.ability.extra.mult_per,
			}
		}
	end,

	-- look at wiki for info i aint writing it down here
	calculate = function(self, card, context)
		if context.pre_joker then
			card.ability.extra.mult = JOAF.count_jokers_of_rarity(2) * card.ability.extra.mult_per
		end
		if context.joker_main then
			return	{
				mult = card.ability.extra.mult
			}
		end
	end
}