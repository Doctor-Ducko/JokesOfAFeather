SMODS.Joker {
	key = 'binary_joker',
	atlas = 'JOAFJokers',
	pos = { x = 3, y = 0 }, -- works on a +1 increment, not based off of pixels
	rarity = 1, -- 1: common, 2: uncommon, 3: rare, 4: legendary
	cost = 5,
	blueprint_compat = true,

	loc_txt = {
		name = 'Binary Joker',
		text = {
			"Each played {C:attention}Ace{} or {C:attention}2",
			"gives {C:mult}+#1#{} Mult when scored"
		}
	},

	config = {
		extra = {
			mult = 10
		}
	},

	loc_vars = function(self, info_queue, card)
		return {
			vars = {
				card.ability.extra.mult
			}
		}
	end,

	calculate = function(self, card, context)
		if context.individual and context.cardarea == G.play then
			--Jack is 11, Queen is 12, King is 13, and Ace is 14.
			if context.other_card:get_id() == 14 or context.other_card:get_id() == 2 then
				return {
					mult = card.ability.extra.mult,
					card = context.other_card
				}
			end
		end
	end
}