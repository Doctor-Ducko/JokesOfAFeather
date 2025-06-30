SMODS.Joker {
	key = 'joker_face',			-- Object ID, acessed with j_joaf_[key]
	atlas = 'JOAFJokers',		-- Spritesheet to use, initalized in main script
	pos = {x = 2, y = 1},		-- works on a +1 increment, not based off of pixels
	rarity = 2,					-- 1-Common | 2-Uncommon | 3-Rare | 4-Legendary, string id for modded rarities, found in main script
	cost = 7,					-- shop price
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
		name = 'Joker Face',
		text = {
			"Increases payout by {C:money}$#1#{}",
			"when a {C:attention}face card{} is scored",
			"{C:inactive}(Currently {C:money}$#2#{C:inactive})"
		}
	},

	-- Variables used in loc_vars and calculate
	config = {
		extra = {
			increase = 1,
			payout = 0
		}	
	},
	-- Variables to be used in the loc_txt area
	loc_vars = function(self, info_queue, card)
		return {
			vars = {
				card.ability.extra.increase,
				card.ability.extra.payout,
			}
		}
	end,

	-- look at wiki for info i aint writing it down here
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play then
			if context.other_card:is_face() then
				card.ability.extra.payout = card.ability.extra.payout + card.ability.extra.increase
				return {
					card = card,
					message = "Upgraded!",
					colour = G.C.MONEY
				}
			end
        end
		if context.ending_shop then
			card.ability.extra.payout = 0
			return {
				message = "Reset!"
			}
		end
	end,

	calc_dollar_bonus = function(self, card)
		local bonus = card.ability.extra.payout
		if bonus > 0 then return bonus end
	end
}