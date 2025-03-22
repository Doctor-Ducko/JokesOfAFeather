SMODS.Joker {
	key = "straight_line",
	atlas = 'JOAFJokers',
	pos = { x = 2, y = 0 },
	rarity = 2,
	cost = 7,
	blueprint_compat = true,

	loc_txt = {
		name = "Straight Line",
		text = {
			"Gains {X:mult,C:white} X#2# {} Mult",
			"if played hand",
			"contains a {C:attention}Straight{}",
			"{C:inactive}(Currently {X:mult,C:white}X#1#{}{C:inactive} Mult)"
		}
	},

	config = {
		extra = {
			Xmult = 1,
			Xmult_gain = 0.2
		}
	},

	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.Xmult, card.ability.extra.Xmult_gain } }
	end,

	calculate = function(self, card, context)
		if context.joker_main then
			return {
				Xmult_mod = card.ability.extra.Xmult,
				message = localize { type = 'variable', key = 'a_xmult', vars = { card.ability.extra.Xmult } }
			}
		end
		if context.before and next(context.poker_hands['Straight']) and not context.blueprint then
			card.ability.extra.Xmult = card.ability.extra.Xmult + card.ability.extra.Xmult_gain
			return {
				message = 'Upgraded!',
				colour = G.C.XMULT,
				card = card
			}
		end
	end
}