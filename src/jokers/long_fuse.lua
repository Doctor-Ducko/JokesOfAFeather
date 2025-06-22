SMODS.Joker {
	key = "long_fuse",			-- Object ID, acessed with j_joaf_[key]
	atlas = "JOAFJokers",		-- Spritesheet to use, initalized in main script
	pos = {x = 2, y = 3},		-- works on a +1 increment, not based off of pixels
	rarity = 1,					-- 1-Common | 2-Uncommon | 3-Rare | 4-Legendary, string id for modded rarities, found in main script
	cost = 4,					-- shop price

	blueprint_compat = false,	-- Cosmetic only, define in calculate function
	eternal_compat = true,		-- Self Explanatory
	perishable_compat = true,

	unlocked = true,			-- Do not change these, they make the jokers visible on mod download
	discovered = false,

	-- Display text
	loc_txt = {
		name = "Long Fuse",
		text = {
			"{C:attention}Dynamite Cards{} have a {C:green}#1# in #2#{}",
			"chance of not losing a turn"
		}
	},

	-- Variables used in loc_vars and calculate
	config = {
		extra = {
			odds = 4
		}
	},
	-- Variables to be used in the loc_txt area
	loc_vars = function(self, info_queue, card)
		info_queue[#info_queue+1] = G.P_CENTERS.m_joaf_dynamite
		return {
			vars = {
				G.GAME.probabilities.normal,
				card.ability.extra.odds,
			}
		}
	end,
}