SMODS.Joker {
	key = "misplaced",
	atlas = 'JOAFJokers',
	pos = { x = 5, y = 0 }, -- works on a +1 increment, not based off of pixels
	rarity = 1, -- 1: common, 2: uncommon, 3: rare, 4: legendary
	cost = 3,

	blueprint_compat = false,

	loc_txt = {
		name = "Misplaced",
		text = {
			"Gain {C:blue}+#1#{} hand",
			"per round",
			"{C:attention}Evolves{} after {C:attention}#2# {C:inactive}(#3#){} rounds"
		}
	},

	config = {
		extra = {
			hand_size = 1,
			rounds_to_evo = 3,
			rounds_left = 3
		}
	},

	loc_vars = function(self, info_queue, card)
		return { vars = {
			card.ability.extra.hand_size,
			card.ability.extra.rounds_to_evo,
			card.ability.extra.rounds_left,
		}}
	end,

	add_to_deck = function(self, card, from_debuff)
		G.GAME.round_resets.hands = G.GAME.round_resets.hands + card.ability.extra.hand_size
	end,
	-- Inverse of above function.
	remove_from_deck = function(self, card, from_debuff)
		G.GAME.round_resets.hands = G.GAME.round_resets.hands - card.ability.extra.hand_size
	end,

	calculate = function(self, card, context)
		if context.end_of_round and context.cardarea == G.jokers then
			card.ability.extra.rounds_left = card.ability.extra.rounds_left - 1
			if card.ability.extra.rounds_left <= 0 then
				local eval = function(card) return not card.REMOVED end
                juice_card_until(card, eval, true)
				return {
					message = "Ready!"
				}
			end
		end

		if context.selling_self and card.ability.extra.rounds_left <= 0 then
			SMODS.add_card(
				{
					set = "Joker",
					key = "j_joaf_really_misplaced"
				}
			)
		end
	end
}