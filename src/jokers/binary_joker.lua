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
			"{C:mult}+#1#{} Mult if played card",
			"is an {C:attention}Ace{} or a {C:attention}2",
		}
	},

	config = {
		extra = {
			mult = 8
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
					card = card
				}
			end
		end
	end
}