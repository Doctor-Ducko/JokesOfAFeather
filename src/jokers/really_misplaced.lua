SMODS.Joker {
	key = "really_misplaced",
	atlas = 'JOAFJokers',
	pos = { x = 1, y = 4 }, -- works on a +1 increment, not based off of pixels
	rarity = 2, -- 1: common, 2: uncommon, 3: rare, 4: legendary
	cost = 6,

	blueprint_compat = false,

	loc_txt = {
		name = "Really Misplaced",
		text = {
			"Gain {C:blue}+#1#{} hands",
			"per round"
		}
	},

	config = {
		extra = {
			hand_size = 2,
		}
	},

	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.hand_size } }
	end,

	in_pool = function(self, args)
        return false, { allow_duplicates = false }
    end,

	add_to_deck = function(self, card, from_debuff)
		G.GAME.round_resets.hands = G.GAME.round_resets.hands + card.ability.extra.hand_size
	end,
	-- Inverse of above function.
	remove_from_deck = function(self, card, from_debuff)
		G.GAME.round_resets.hands = G.GAME.round_resets.hands - card.ability.extra.hand_size
	end
}