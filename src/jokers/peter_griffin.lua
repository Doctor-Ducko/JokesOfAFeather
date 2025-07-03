SMODS.Joker {
	key = 'peter_griffin',
	atlas = 'JOAFJokers',
	pos = { x = 9, y = 0 }, -- works on a +1 increment, not based off of pixels
	rarity = "joaf_family", -- 1: common, 2: uncommon, 3: rare, 4: legendary
	cost = 20,
	pools = {
		["JOAFJokers"] = true
	},
	blueprint_compat = true,

	loc_txt = {
		name = 'Peter Griffin',
		text={
			"Scores {X:mult,C:white}X#1#{} Mult",
			"for every {C:joaf_family}Family Guy{C:attention} Joker",
			"you have",
			"if you have {C:attention}#3#{} copies of this Joker,", 
			"Give {X:joaf_e_mult,C:white}+^#2#{} Mult per {C:attention}copy{}",
			"{C:inactive}(Including this Joker)",
			"{C:inactive,s:0.9}(It seems today)",
		},
	},

	config = {
		extra = {
			x_mult = 3,
			e_mult = 0.01,
			copies_needed = 23
		}
	},

	loc_vars = function(self, info_queue, card)
		return {
			vars = {
				card.ability.extra.x_mult,
				card.ability.extra.e_mult,
				card.ability.extra.copies_needed,
			}
		}
	end,

	calculate = function(self, card, context)
		if context.joker_main then
			if #SMODS.find_card("j_joaf_peter_griffin") >= card.ability.extra.copies_needed then
				return {
					e_mult = 1 + (card.ability.extra.e_mult * JOAF.count_jokers_of_rarity("joaf_family")),
				}			
			else
				return {
					x_mult = card.ability.extra.x_mult * JOAF.count_jokers_of_rarity("joaf_family"),
				}
			end
		end
	end
}