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
			"Scores {X:mult,C:white}X#1#{} Mult",
			"for every {C:joaf_family}Family Guy{C:attention} Joker",
			"you have",
			"{C:inactive}(Including this Joker)",
			"{C:inactive,s:0.9}(It seems today)",
		},
	},

	config = {
		extra = {
			x_mult = 3,
		}
	},

	loc_vars = function(self, info_queue, card)
		return {
			vars = {
				card.ability.extra.x_mult,
			}
		}
	end,

	calculate = function(self, card, context)
		if context.joker_main then
			return {
				x_mult = card.ability.extra.x_mult * JOAF.count_jokers_of_rarity("joaf_family"),
			}
		end
	end
}