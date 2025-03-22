SMODS.Joker {
	key = 'sunflower_joker',
	atlas = 'JOAFJokers',
	pos = { x = 5, y = 1 }, -- works on a +1 increment, not based off of pixels
	rarity = 1, -- 1: common, 2: uncommon, 3: rare, 4: legendary
	cost = 5,
	blueprint_compat = false,

	loc_txt = {
		name = 'Sunflower Joker',
		text={
			"Earn {C:money}$#1#{} when",
			"the round ends",
			"Increases by {C:attention}#2#{} when",
			"the round ends",
			"Maxes out at {C:money}$#3#{}"
		},
	},

	config = {
		extra = {
			money = 1,
			money_increase = 1,
			money_limit = 5
		}
	},

	loc_vars = function(self, info_queue, card)
		return {
			vars = {
				card.ability.extra.money,
				card.ability.extra.money_increase,
				card.ability.extra.money_limit,
			}
		}
	end,

	calc_dollar_bonus = function(self, card)
		local bonus = card.ability.extra.money
		if bonus > 0 then return bonus end
	end,

	calculate = function(self, card, context)
		if context.end_of_round and context.cardarea == G.jokers and (card.ability.extra.money + card.ability.extra.money_increase <= card.ability.extra.money_limit) then
			card.ability.extra.money = card.ability.extra.money + card.ability.extra.money_increase
			return {
				message = 'Upgraded!',
				colour = G.C.MONEY,
				card = card
			}
		end
	end
}