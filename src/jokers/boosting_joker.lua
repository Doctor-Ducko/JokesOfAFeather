SMODS.Joker {
	key = "boosting_joker",			-- Object ID, acessed with j_joaf_[key]
	atlas = "JOAFJokers",		-- Spritesheet to use, initalized in main script
	pos = {x = 6, y = 5},		-- works on a +1 increment, not based off of pixels
	rarity = 2,					-- 1-Common | 2-Uncommon | 3-Rare | 4-Legendary, string id for modded rarities, found in main script
	cost = 7,					-- shop price
	pools = {
		["JOAFJokers"] = true
	},
	blueprint_compat = true,	-- Cosmetic only, define in calculate function
	eternal_compat = true,		-- Self Explanatory
	perishable_compat = true,

	unlocked = true,			-- Do not change these, they make the jokers visible on mod download
	discovered = false,

	-- Display text
	loc_txt = {
		name = "Boosting Joker",
		text = {
			"Gains {X:mult,C:white}X#1#{} Mult when",
			"opening a {C:attention}Booster Pack",
			"Loses {X:mult,C:white}X#2#{} Mult when",
			"skipping a {C:attention}Booster Pack",
			"{C:inactive}(Currently {X:mult,C:white}X#3#{C:inactive} Mult)"
		}
	},

	-- Variables used in loc_vars and calculate
	config = {
		extra = {
			gain = 0.2,
			loss = 0.3,
			x_mult = 1
		}
	},

	set_badges = function(self, card, badges)
		--JOAF.reference_badge(card, badges, "deltarune")
	end,
	
	-- Variables to be used in the loc_txt area
	loc_vars = function(self, info_queue, card)
		return {
			vars = {
				card.ability.extra.gain,
				card.ability.extra.loss,
				card.ability.extra.x_mult,
			}
		}
	end,

	-- look at wiki for info i aint writing it down here
	calculate = function(self, card, context)
		if context.joker_main then
			return {
				x_mult = card.ability.extra.x_mult
			}
		end
		if context.open_booster then
			card.ability.extra.x_mult = card.ability.extra.x_mult + card.ability.extra.gain
			return {
				message = "Upgraded!",
				colour = G.C.MULT
			}
		end
		if context.skipping_booster then
			card.ability.extra.x_mult = card.ability.extra.x_mult - card.ability.extra.loss
			if card.ability.extra.x_mult < 1 then
				card.ability.extra.x_mult = 1
			end
			return {
				message = "Downgraded. :(",
				colour = G.C.MULT
			}
		end
	end
}