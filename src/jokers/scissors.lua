SMODS.Joker {
	key = "scissors",			-- Object ID, acessed with j_joaf_[key]
	atlas = "JOAFJokers",		-- Spritesheet to use, initalized in main script
	pos = {x = 4, y = 4},		-- works on a +1 increment, not based off of pixels
	rarity = 1,					-- 1-Common | 2-Uncommon | 3-Rare | 4-Legendary, string id for modded rarities, found in main script
	cost = 6,					-- shop price

	blueprint_compat = false,	-- Cosmetic only, define in calculate function
	eternal_compat = true,		-- Self Explanatory
	perishable_compat = true,

	unlocked = true,			-- Do not change these, they make the jokers visible on mod download
	discovered = false,

	-- Display text
	loc_txt = {
		name = "Scissors",
		text = {
			"Reduce {C:attention}Blind requirement{}",
			"by {C:attention}#1#%{}",
			"Lowers by {C:attention}#2#%{}",
			"after every snip"
		}
	},

	-- Variables used in loc_vars and calculate
	config = {
		extra = {
			percent_requirement = 80,
			percent_increase = 4
		}
	},
	-- Variables to be used in the loc_txt area
	loc_vars = function(self, info_queue, card)
		return {
			vars = {
				100 - card.ability.extra.percent_requirement,
				card.ability.extra.percent_increase,
			}
		}
	end,

	-- look at wiki for info i aint writing it down here
	calculate = function(self, card, context)
		if context.setting_blind then
			-- Lower blind req
			G.GAME.blind.chips = G.GAME.blind.chips * (card.ability.extra.percent_requirement / 100)
			G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)

			card.ability.extra.percent_requirement = card.ability.extra.percent_requirement + card.ability.extra.percent_increase

			if card.ability.extra.percent_requirement == 100 then
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
					message = "Broke!",
				}
			else
				return {
					message = "Snipped!",
				}
			end
		end
	end
}