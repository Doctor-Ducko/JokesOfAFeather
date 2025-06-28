SMODS.Joker {
	key = 'jokr',
	atlas = 'JOAFJokers',
	pos = { x = 6, y = 1 }, -- works on a +1 increment, not based off of pixels
	rarity = 2, -- 1: common, 2: uncommon, 3: rare, 4: legendary
	cost = 5,
	pools = {
		["JOAFJokers"] = true
	},
	blueprint_compat = true,

	loc_txt = {
		name = 'Jokr',
		text = {
			"Playing cards {C:attention}without{}",
			"an {C:attention}\"E\"{} in its rank",
			"hand out {C:mult}+#1#{} Mult",
			"{C:inactive}(2, 4, 6, Jack, King){}",
			"{C:inactive}(Avoid fifth glyph)"
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
