SMODS.Joker {
	key = 'precious_joker',			-- Object ID, acessed with j_joaf_[key]
	atlas = 'JOAFJokers',		-- Spritesheet to use, initalized in main script
	pos = {x = 9, y = 2},		-- works on a +1 increment, not based off of pixels
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
		name = 'Precious Joker',
		text = {
			"Scores {X:mult,C:white}+X#1#{} Mult",
			"for every {C:rare}Rare{C:attention} Joker",
			"you have",
			"{C:inactive}(Currently {X:mult,C:white}X#2#{C:inactive} Mult)"
		}
	},

	-- Variables used in loc_vars and calculate
	config = {
		extra = {
			xmult_per = 0.5,
		}
	},
	-- Variables to be used in the loc_txt area
	loc_vars = function(self, info_queue, card)
		return {
			vars = {
				card.ability.extra.xmult_per,
				(JOAF.count_jokers_of_rarity(3) * card.ability.extra.xmult_per) + 1
			}
		}
	end,

	-- look at wiki for info i aint writing it down here
	calculate = function(self, card, context)
		if context.joker_main then
			return	{
				x_mult = (JOAF.count_jokers_of_rarity(3) * card.ability.extra.xmult_per) + 1
			}
		end
	end
}