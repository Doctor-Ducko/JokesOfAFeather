SMODS.Joker {
	key = "ice_pop_r",			-- Object ID, acessed with j_joaf_[key]
	atlas = "JOAFJokers",		-- Spritesheet to use, initalized in main script
	pos = {x = 8, y = 5},		-- works on a +1 increment, not based off of pixels
	rarity = 1,					-- 1-Common | 2-Uncommon | 3-Rare | 4-Legendary, string id for modded rarities, found in main script
	cost = 5,					-- shop price
	pools = {
		["JOAFJokers"] = true,
		["Food"] = true,
	},
	blueprint_compat = true,	-- Cosmetic only, define in calculate function
	eternal_compat = true,		-- Self Explanatory
	perishable_compat = true,

	unlocked = true,			-- Do not change these, they make the jokers visible on mod download
	discovered = false,

	-- Display text
	loc_txt = {
		name = "Ice Pop (Red)",
		text = {
			"{C:mult}+#1#{} Mult",
			"Decreases by {C:attention}#2#{}",
			"at end of round",
			"Decrement increases by {C:attention}1{}",
			"after end of round"
		}
	},

	-- Variables used in loc_vars and calculate
	config = {
		extra = {
			mult = 30,
			decrease = 1,
		}
	},

	set_badges = function(self, card, badges)
		--JOAF.reference_badge(card, badges, "deltarune")
	end,
	
	-- Variables to be used in the loc_txt area
	loc_vars = function(self, info_queue, card)
		return {
			vars = {
				card.ability.extra.mult,
				card.ability.extra.decrease,
			}
		}
	end,

	-- look at wiki for info i aint writing it down here
	calculate = function(self, card, context)
		if context.joker_main then
			return {
				mult = card.ability.extra.mult
			}
		end
		if context.end_of_round and context.cardarea == G.jokers then
			card.ability.extra.mult = card.ability.extra.mult - card.ability.extra.decrease
			card.ability.extra.decrease = card.ability.extra.decrease + 1
			if card.ability.extra.mult > 0 then
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