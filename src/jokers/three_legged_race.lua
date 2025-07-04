SMODS.Joker {
	key = "three_legged_race",			-- Object ID, acessed with j_joaf_[key]
	atlas = "JOAFJokers",		-- Spritesheet to use, initalized in main script
	pos = {x = 0, y = 0},		-- works on a +1 increment, not based off of pixels
	pools = {
		["JOAFJokers"] = true
	},
	rarity = 3,					-- 1-Common | 2-Uncommon | 3-Rare | 4-Legendary, string id for modded rarities, found in main script
	cost = 8,					-- shop price

	blueprint_compat = true,	-- Cosmetic only, define in calculate function
	eternal_compat = true,		-- Self Explanatory
	perishable_compat = true,

	unlocked = true,			-- Do not change these, they make the jokers visible on mod download
	discovered = false,

	-- Display text
	loc_txt = {
		name = "Three Legged Race",
		text = {
			"Retrigger all cards {C:attention}#1#{} times",
			"if played hand contains an",
			"{C:attention}even{} amount of cards",
			"{C:inactive}(Everyone needs a partner)"
		}
	},

	-- Variables used in loc_vars and calculate
	config = {
		extra = {
			retriggers = 2
		}
	},
	-- Variables to be used in the loc_txt area
	loc_vars = function(self, info_queue, card)
		return {
			vars = {
				card.ability.extra.retriggers
			}
		}
	end,

	-- look at wiki for info i aint writing it down here
	calculate = function(self, card, context)
		if context.repetition and context.cardarea == G.play and #context.scoring_hand % 2 == 0 then
			return {
				repetitions = card.ability.extra.retriggers
			}
		end
	end
}