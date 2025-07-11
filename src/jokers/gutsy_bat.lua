SMODS.Joker {
	key = "gutsy_bat",			-- Object ID, acessed with j_joaf_[key]
	atlas = "JOAFJokers",		-- Spritesheet to use, initalized in main script
	pos = {x = 5, y = 4},		-- works on a +1 increment, not based off of pixels
	rarity = 3,					-- 1-Common | 2-Uncommon | 3-Rare | 4-Legendary, string id for modded rarities, found in main script
	cost = 8,					-- shop price
	pools = {
		["JOAFJokers"] = true
	},

	blueprint_compat = true,	-- Cosmetic only, define in calculate function
	eternal_compat = true,		-- Self Explanatory
	perishable_compat = true,

	unlocked = true,			-- Do not change these, they make the jokers visible on mod download
	discovered = false,

	set_badges = function(self, card, badges)
		JOAF.reference_badge(card, badges, "earthbound")
	end,

	-- Variables used in loc_vars and calculate
	config = {
		extra = {
			odds = 20,
			e_mult = 1.5,
			x_mult = 50,
		}
	},
	-- Variables to be used in the loc_txt area
	loc_vars = function(self, info_queue, card)
		local key = self.key
		if not JOAF.has_talisman then
			key = key .. "_no_talisman"
		end
		return {
			vars = {
				G.GAME.probabilities.normal,
				card.ability.extra.odds,
				card.ability.extra.e_mult,
				card.ability.extra.x_mult,
			},
			key = key,
		}
	end,

	-- look at wiki for info i aint writing it down here
	calculate = function(self, card, context)
		if context.joker_main and pseudorandom('j_joaf_gutsy_bat') < G.GAME.probabilities.normal / card.ability.extra.odds then
			if JOAF.has_talisman then
				return {
					e_mult = card.ability.extra.e_mult
				}
			else
				return {
					x_mult = card.ability.extra.x_mult
				}
			end
		end
	end
}