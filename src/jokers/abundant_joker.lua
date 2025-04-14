SMODS.Joker {
	key = 'abundant_joker',			-- Object ID, acessed with j_joaf_[key]
	atlas = 'JOAFJokers',		-- Spritesheet to use, initalized in main script
	pos = {x = 7, y = 2},		-- works on a +1 increment, not based off of pixels
	rarity = 1,					-- 1-Common | 2-Uncommon | 3-Rare | 4-Legendary, string id for modded rarities, found in main script
	cost = 5,					-- shop price

	blueprint_compat = true,	-- Cosmetic only, define in calculate function
	eternal_compat = true,		-- Self Explanatory
	perishable_compat = true,

	unlocked = true,			-- Do not change these, they make the jokers visible on mod download
	discovered = true,

	-- Display text
	loc_txt = {
		name = 'Abundant Joker',
		text = {
			"Scores {C:chips}+#1#{} chips for",
			"every {C:blue}Common{C:attention} Joker",
			"you have",
			"{C:inactive}(Including this Joker)"
		}
	},

	-- Variables used in loc_vars and calculate
	config = {
		extra = {
			chips_per = 40,
			chips = 40,
		}
	},
	-- Variables to be used in the loc_txt area
	loc_vars = function(self, info_queue, card)
		return {
			vars = {
				card.ability.extra.chips_per,
			}
		}
	end,

	-- look at wiki for info i aint writing it down here
	calculate = function(self, card, context)
		if context.pre_joker then
			card.ability.extra.chips = JOAF.count_jokers_of_rarity(1) * card.ability.extra.chips_per
		end
		if context.joker_main then
			return	{
				chips = card.ability.extra.chips
			}
		end
	end
}