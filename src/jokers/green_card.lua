SMODS.Joker {
	key = "green_card",			-- Object ID, acessed with j_joaf_[key]
	atlas = "JOAFJokers",		-- Spritesheet to use, initalized in main script
	pos = {x = 2, y = 5},		-- works on a +1 increment, not based off of pixels
	rarity = 1,					-- 1-Common | 2-Uncommon | 3-Rare | 4-Legendary, string id for modded rarities, found in main script
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
		name = "Green Card",
		text = {
			"{C:attention}#1#{} free {C:green}Reroll{}",
			"when skipping a {C:attention}Booster Pack",
			"{C:inactive}(Not for proving residence)"
		}
	},

	-- Variables used in loc_vars and calculate
	config = {
		extra = {
			rerolls = 1,
			reset = 0
		}
	},
	
	-- Variables to be used in the loc_txt area
	loc_vars = function(self, info_queue, card)
		return {
			vars = {
				card.ability.extra.rerolls
			}
		}
	end,

	-- look at wiki for info i aint writing it down here
	calculate = function(self, card, context)
		if context.skipping_booster then
			SMODS.change_free_rerolls(card.ability.extra.rerolls)
			card.ability.extra.reset = card.ability.extra.reset + 1
			return {
				message = "Free-roll!",
				colour = G.C.GREEN
			}
		end
		if context.ending_shop then
			SMODS.change_free_rerolls(-card.ability.extra.reset)
			card.ability.extra.reset = 0
		end
	end
}