SMODS.Joker {
	key = 'jokr',
	atlas = 'JOAFJokers',
	pos = { x = 6, y = 1 }, -- works on a +1 increment, not based off of pixels
	rarity = 3, -- 1: common, 2: uncommon, 3: rare, 4: legendary
	cost = 9,
	blueprint_compat = true,

	loc_txt = {
		name = 'Jokr',
		text = {
			"{C:mult}+#1#{} Mult if thescored card ",
			"does {C:attention}not{} contain an \"E\" in",
			"it's name or number",
			"{C:inactive}(2, 4, 6, Jack, King){}"
		}
	},

	config = {
		extra = {
			mult = 20
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
			-- Two
			-- Four
			-- Six
			--Jack is 11, King is 13.
			if context.other_card:get_id() == 2 or context.other_card:get_id() == 4 or context.other_card:get_id() == 6 or context.other_card:get_id() == 11 or context.other_card:get_id() == 13 then
				return {
					mult = card.ability.extra.mult,
					card = card
				}
			end
		end
	end
}