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

	config = {
		extra = {
			x_mult = 3,
			e_mult = 0.01,
			copies_needed = 23
		}
	},

	loc_vars = function(self, info_queue, card)
		local key = self.key
		if not JOAF.has_talisman then
			key = key .. "_no_talisman"
		elseif #SMODS.find_card("j_joaf_peter_griffin") >= card.ability.extra.copies_needed then
			key = key .. "_alt"
		end
		return {
			vars = {
				card.ability.extra.x_mult,
				card.ability.extra.e_mult,
				card.ability.extra.copies_needed,
				card.ability.extra.x_mult * JOAF.count_jokers_of_rarity("joaf_family"),
				1 + (card.ability.extra.e_mult * JOAF.count_jokers_of_rarity("joaf_family"))
			},
			key = key
		}
	end,

	calculate = function(self, card, context)
		if context.joker_main then
			if #SMODS.find_card("j_joaf_peter_griffin") >= card.ability.extra.copies_needed and JOAF.has_talisman then
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