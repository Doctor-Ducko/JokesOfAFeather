SMODS.Joker {
	key = 'lois_griffin',
	atlas = 'JOAFJokers',
	pos = { x = 10, y = 0 }, -- works on a +1 increment, not based off of pixels
	rarity = "joaf_family", -- 1: common, 2: uncommon, 3: rare, 4: legendary
	cost = 20,
	blueprint_compat = false,

	loc_txt = {
		name = 'Lois Griffin',
		text={
			"Earn {C:money}$#1#{} when",
			"the round ends",
			"{C:inactive,s:0.9}(That all you see)",
		},
	},

	config = {
		extra = {
			money = 10
		}
	},

	loc_vars = function(self, info_queue, card)
		return {
			vars = {
				card.ability.extra.money
			}
		}
	end,

	calc_dollar_bonus = function(self, card)
		local bonus = card.ability.extra.money
		if bonus > 0 then return bonus end
	end
}