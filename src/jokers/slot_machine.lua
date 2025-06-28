SMODS.Joker {
	key = 'slot_machine',			-- Object ID, acessed with j_joaf_[key]
	atlas = 'JOAFJokers',		-- Spritesheet to use, initalized in main script
	pos = {x = 11, y = 2},		-- works on a +1 increment, not based off of pixels
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
		name = 'Slot Machine',
		text = {
			"Scored {C:attention}7{}'s have a {C:green}#1# in #2#{}",
			"chance to score {C:money}$#3#{}"
		}
	},

	-- Variables used in loc_vars and calculate
	config = {
		extra = {
			odds = 7,
			payout = 20,
		}
	},
	-- Variables to be used in the loc_txt area
	loc_vars = function(self, info_queue, card)
		return {
			vars = {
				G.GAME.probabilities.normal,
				card.ability.extra.odds,
				card.ability.extra.payout,
			}
		}
	end,

	-- look at wiki for info i aint writing it down here
	calculate = function(self, card, context)
		if context.individual and context.cardarea == G.play then
			if context.other_card:get_id() == 7 then
				if pseudorandom('slot_machine') < G.GAME.probabilities.normal / card.ability.extra.odds then
					return {
						dollars = card.ability.extra.payout,
						colour = G.C.MONEY
					}
				end
			end
		end
	end
}