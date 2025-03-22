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
			"according to the base",
			"chip value of the scored card"
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
			local bonus = context.other_card:get_id()

			-- someone please tell me there's a better way to do this, this sucks ass
			if bonus >= 11 and bonus <= 13 then
				bonus = 10
			elseif bonus == 14 then
				bonus = 11
			end

			if context.other_card.ability.effect == "Stone Card" then
				bonus = 50
			end
			return {
				chips = bonus,
				card = card
			}
		end
	end
}