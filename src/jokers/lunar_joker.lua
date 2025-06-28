SMODS.Joker {
	key = "lunar_joker",			-- Object ID, acessed with j_joaf_[key]
	atlas = "JOAFJokers",		-- Spritesheet to use, initalized in main script
	pos = {x = 0, y = 3},		-- works on a +1 increment, not based off of pixels
	rarity = 2,					-- 1-Common | 2-Uncommon | 3-Rare | 4-Legendary, string id for modded rarities, found in main script
	cost = 5,					-- shop price
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
		name = "Lunar Joker",
		text = {
			"{C:mult}+#1#{} Mult per level on",
			"all {C:attention}discovered{} poker hands"
		}
	},

	-- Variables used in loc_vars and calculate
	config = {
		extra = {
			mult_per_level = 2
		}
	},
	-- Variables to be used in the loc_txt area
	loc_vars = function(self, info_queue, card)
		return {
			vars = {
				card.ability.extra.mult_per_level
			}
		}
	end,

	-- look at wiki for info i aint writing it down here
	calculate = function(self, card, context)
		if context.joker_main then
			return {
				mult = self.total_hand_levels() * card.ability.extra.mult_per_level,
			}
		end
	end,

	total_hand_levels = function()
		local total = 0
		for hand, tbl in pairs(G.GAME.hands) do
			if JOAF.get_poker_hand_stat(hand, "visible") then
				total = total + JOAF.get_poker_hand_stat(hand, "level")
			end
		end
		return total
	end
}