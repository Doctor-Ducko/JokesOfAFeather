SMODS.Joker {
	key = 'dr_pepper',
	atlas = 'JOAFJokers',
	pos = { x = 7, y = 0 }, -- works on a +1 increment, not based off of pixels
	rarity = 2, -- 1: common, 2: uncommon, 3: rare, 4: legendary
	cost = 7,
	blueprint_compat = true,

	loc_txt = {
		name = 'Dr. Pepper',
		text = {
			"{C:mult}+#1#{} Mult",
			"{C:mult}-#2#{} Mult per round"
		}
	},

	config = {
		extra = {
			mult = 20,
			mult_loss = 2
		}
	},

	loc_vars = function(self, info_queue, card)
		return {
			vars = {
				card.ability.extra.mult,
				card.ability.extra.mult_loss,
			}
		}
	end,

	calculate = function(self, card, context)
		if context.joker_main then
			return {
				mult = card.ability.extra.mult,
				card = card
			}
		end
		if context.end_of_round and context.cardarea == G.jokers then
			card.ability.extra.mult = card.ability.extra.mult - card.ability.extra.mult_loss
			local value = card.ability.extra.mult
			if value <= 0 then
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
					message = 'Drank!',
					card = card
				}
			else
				return {
					message = 'Sip.',
					card = card
				}
			end
		end
	end
}