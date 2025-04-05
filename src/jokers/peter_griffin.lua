SMODS.Joker {
	key = 'peter_griffin',
	atlas = 'JOAFJokers',
	pos = { x = 9, y = 0 }, -- works on a +1 increment, not based off of pixels
	rarity = "joaf_family", -- 1: common, 2: uncommon, 3: rare, 4: legendary
	cost = 20,
	blueprint_compat = true,

	loc_txt = {
		name = 'Peter Griffin',
		text={
			"{X:mult,C:white}X#1#{} Mult",
			"{C:inactive,s:0.9}(It seems today)",
		},
	},

	config = {
		extra = {
			Xmult = 5,
		}
	},

	loc_vars = function(self, info_queue, card)
		return {
			vars = {
				card.ability.extra.Xmult,
				card.ability.extra.Xchips
			}
		}
	end,

	calculate = function(self, card, context)
		if context.joker_main then
			return {
				Xmult_mod = card.ability.extra.Xmult,
				message = localize { type = 'variable', key = 'a_xmult', vars = { card.ability.extra.Xmult } }
			}
		end
	end
}