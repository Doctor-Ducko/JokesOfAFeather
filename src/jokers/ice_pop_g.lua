SMODS.Joker {
	key = "ice_pop_g",			-- Object ID, acessed with j_joaf_[key]
	atlas = "JOAFJokers",		-- Spritesheet to use, initalized in main script
	pos = {x = 10, y = 5},		-- works on a +1 increment, not based off of pixels
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
		name = "Ice Pop (Green)",
		text = {
			"{C:green}#1#{} free reroll(s) per shop",
			"Decreases by {C:attention}#2#{}",
			"at end of round",
			"Decrement increases by {C:attention}#3#{}",
			"after end of round"
		}
	},

	-- Variables used in loc_vars and calculate
	config = {
		extra = {
			rerolls = 10,
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
				card.ability.extra.rerolls,
				card.ability.extra.decrease,
				card.ability.extra.dec_inc,
			}
		}
	end,

	add_to_deck = function(self, card, from_debuff)
        SMODS.change_free_rerolls(card.ability.extra.rerolls)
	end,
	-- Inverse of above function.
	remove_from_deck = function(self, card, from_debuff)
        SMODS.change_free_rerolls(-card.ability.extra.rerolls)
	end,

	-- look at wiki for info i aint writing it down here
	calculate = function(self, card, context)
		if context.end_of_round and context.cardarea == G.jokers then
			card.ability.extra.rerolls = card.ability.extra.rerolls - card.ability.extra.decrease
			SMODS.change_free_rerolls(-card.ability.extra.decrease)
			card.ability.extra.decrease = card.ability.extra.decrease + card.ability.extra.dec_inc

			if card.ability.extra.rerolls > 0 then
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
	end
}