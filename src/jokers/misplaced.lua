SMODS.Joker {
	key = "misplaced",
	atlas = 'JOAFJokers',
	pos = { x = 5, y = 0 }, -- works on a +1 increment, not based off of pixels
	rarity = 2, -- 1: common, 2: uncommon, 3: rare, 4: legendary
	cost = 7,

	loc_txt = {
		name = "Misplaced",
		text = {
			"Gain {C:blue}+#1#{} hand",
			"per round"
		}
	},

	config = {
		extra = {
			hand_size = 1,
		}
	},

	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.hand_size } }
	end,

	add_to_deck = function(self, card, from_debuff)
		G.GAME.round_resets.hands = G.GAME.round_resets.hands + card.ability.extra.hand_size
	end,
	-- Inverse of above function.
	remove_from_deck = function(self, card, from_debuff)
		G.GAME.round_resets.hands = G.GAME.round_resets.hands - card.ability.extra.hand_size
	end
}