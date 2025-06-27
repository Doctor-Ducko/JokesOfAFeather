SMODS.Joker {
	key = 'joker_energy',			-- Object ID, acessed with j_joaf_[key]
	atlas = 'JOAFJokers',		-- Spritesheet to use, initalized in main script
	pos = {x = 10, y = 2},		-- works on a +1 increment, not based off of pixels
	rarity = 3,					-- 1-Common | 2-Uncommon | 3-Rare | 4-Legendary, string id for modded rarities, found in main script
	cost = 8,					-- shop price
	pools = {
		["Food"] = true
	},
	blueprint_compat = true,	-- Cosmetic only, define in calculate function
	eternal_compat = false,		-- Self Explanatory
	perishable_compat = false,

	unlocked = true,			-- Do not change these, they make the jokers visible on mod download
	discovered = false,

	-- Display text
	loc_txt = {
		name = 'Joker Energy',
		text = {
			"Gains {X:mult,C:white}X#1#{} Mult",
			"when selecting a {C:attention}Blind{}",
			"{C:attention}Self-destructs{} at {X:mult,C:white}X#2#{} Mult",
			"When the round ends",
			"{C:inactive}(Currently {X:mult,C:white}X#3#{}{C:inactive} Mult)",
		}
	},

	-- Variables used in loc_vars and calculate
	config = {
		extra = {
			x_mult_increase = 0.2,
			x_mult_max = 3,
			x_mult = 1,
		}
	},

	-- Variables to be used in the loc_txt area
	loc_vars = function(self, info_queue, card)
		return {
			vars = {
				card.ability.extra.x_mult_increase,
				card.ability.extra.x_mult_max,
				card.ability.extra.x_mult,
			}
		}
	end,

	calculate = function(self, card, context)
		if context.setting_blind and not context.blueprint then
			card.ability.extra.x_mult = card.ability.extra.x_mult + card.ability.extra.x_mult_increase
			return {
				message = 'Sip.',
				colour = G.C.RED
			}
		end
		if context.joker_main then
			return {
				x_mult = card.ability.extra.x_mult
			}
		end
		if context.end_of_round and not context.repetition and context.game_over == false and not context.blueprint then
			if card.ability.extra.x_mult >= card.ability.extra.x_mult_max then
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
					message = 'Caffeinated!'
				}
			end
		end
	end
}