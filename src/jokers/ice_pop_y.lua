SMODS.Joker {
	key = "ice_pop_y",			-- Object ID, acessed with j_joaf_[key]
	atlas = "JOAFJokers",		-- Spritesheet to use, initalized in main script
	pos = {x = 11, y = 5},		-- works on a +1 increment, not based off of pixels
	rarity = 2,					-- 1-Common | 2-Uncommon | 3-Rare | 4-Legendary, string id for modded rarities, found in main script
	cost = 7,					-- shop price
	pools = {
		["JOAFJokers"] = true,
		["Food"] = true,
	},
	blueprint_compat = false,	-- Cosmetic only, define in calculate function
	eternal_compat = true,		-- Self Explanatory
	perishable_compat = true,

	unlocked = true,			-- Do not change these, they make the jokers visible on mod download
	discovered = false,

	-- Display text
	loc_txt = {
		name = "Ice Pop (Yellow)",
		text = {
			"Earn {C:money}$#1#{} at end of round",
			"Decreases by {C:attention}#2#{}",
			"at end of round",
			"Decrement increases by {C:attention}#3#{}",
			"after end of round"
		}
	},

	-- Variables used in loc_vars and calculate
	config = {
		extra = {
			payout = 15,
			decrease = 1,
			dec_inc = 1
		}
	},

	set_badges = function(self, card, badges)
		--JOAF.reference_badge(card, badges, "deltarune")
	end,
	
	-- Variables to be used in the loc_txt area
	loc_vars = function(self, info_queue, card)
		return {
			vars = {
				card.ability.extra.payout,
				card.ability.extra.decrease,
				card.ability.extra.dec_inc,
			}
		}
	end,

	-- look at wiki for info i aint writing it down here
	calculate = function(self, card, context)
		if context.end_of_round and context.cardarea == G.jokers then
			card.ability.extra.payout = card.ability.extra.payout - card.ability.extra.decrease
			card.ability.extra.decrease = card.ability.extra.decrease + card.ability.extra.dec_inc

			if card.ability.extra.payout > 0 then
				return {
					message = "Melting..."
				}
			else
				G.E_MANAGER:add_event(Event({
					func = function()
						play_sound('tarot1')
						card.T.r = -0.2
						card:juice_up(0.3, 0.4)
						card.states.drag.is = true
						card.children.center.pinch.x = true
						G.E_MANAGER:add_event(Event({
							trigger = 'after',
							delay = 0.3,
							blockable = false,
							func = function()
								G.jokers:remove_card(card)
								card:remove()
								card = nil
								return true;
							end
						}))
						return true
					end
				}))
				return {
					message = 'Melted!'
				}
			end
		end
	end,

	calc_dollar_bonus = function(self, card)
		local bonus = card.ability.extra.payout
		if bonus > 0 then return bonus end
	end
}