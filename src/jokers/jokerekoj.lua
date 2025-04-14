SMODS.Joker {
	key = "jokerekoj",
	atlas = 'JOAFJokers',
	pos = { x = 6, y = 0 },
	rarity = 1,
	cost = 4,
	blueprint_compat = true,

	loc_txt = {
		name = "JokerekoJ",
		text = {
			"Scores bonus chips",
			"according to the {C:attention}base",
			"{C:attention}chip value of the scored card"
		}
	},

	config = {
		extra = {
		}
	},

	loc_vars = function(self, info_queue, card)
		return {
			vars = {
			}
		}
	end,

	calculate = function(self, card, context)
		if context.individual and context.cardarea == G.play then
			local bonus = JOAF.get_chip_value(context.other_card:get_id(), context.other_card.ability.effect)
			return {
				chips = bonus,
				card = card
			}
		end
	end
}