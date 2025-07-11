SMODS.Joker {
	key = 'emperor',			-- Object ID, acessed with j_joaf_[key]
	atlas = 'JOAFJokers',		-- Spritesheet to use, initalized in main script
	pos = {x = 5, y = 2},		-- works on a +1 increment, not based off of pixels
	soul_pos = { x = 5, y = 3 },
	pools = {
		["JOAFJokers"] = true
	},
	rarity = 4,					-- 1-Common | 2-Uncommon | 3-Rare | 4-Legendary, string id for modded rarities, found in main script
	cost = 20,					-- shop price

	blueprint_compat = true,	-- Cosmetic only, define in calculate function
	eternal_compat = true,		-- Self Explanatory
	perishable_compat = true,

	unlocked = true,			-- Do not change these, they make the jokers visible on mod download
	discovered = false,

	-- Variables used in loc_vars and calculate
	config = {
		extra = {
			e_mult_increase = 0.01,
			x_mult_increase = 0.5
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
				card.ability.extra.e_mult_increase,
				(G.GAME.round * card.ability.extra.e_mult_increase) + 1,
				card.ability.extra.x_mult_increase,
				(G.GAME.round * card.ability.extra.x_mult_increase) + 1,
			},
			key = key
		}
	end,

	-- look at wiki for info i aint writing it down here
	calculate = function(self, card, context)
		if context.joker_main then
			if JOAF.has_talisman then
				return {
					e_mult = (G.GAME.round * card.ability.extra.e_mult_increase) + 1
				}
			else
				return {
					x_mult = (G.GAME.round * card.ability.extra.x_mult_increase) + 1
				}
			end
		end
		if context.setting_blind and not context.blueprint then
			return {
				message = "Upgrade!",
				colour = G.C.MULT
			}
		end
	end
}