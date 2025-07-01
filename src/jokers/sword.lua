if JOAF.config.deltarune_spoilers then
	SMODS.Joker {
		key = "sword",			-- Object ID, acessed with j_joaf_[key]
		atlas = "JOAFJokers",		-- Spritesheet to use, initalized in main script
		pos = {x = 0, y = 5},		-- works on a +1 increment, not based off of pixels
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

		-- Display text
		loc_txt = {
			name = "SWORD",
			text = {
				"Gains {X:mult,C:white}X#2#{} Mult when defeating a {C:attention}Blind",
				"Gains {X:mult,C:white}X#3#{} Mult when defeating a {C:attention}Boss Blind",
				"Gains {X:mult,C:white}X#4#{} Mult when defeating a {C:attention}Showdown Blind",
				"{C:inactive}(Currently {X:mult,C:white}X#1#{C:inactive} Mult)",
			}
		},

		-- Variables used in loc_vars and calculate
		config = {
			extra = {
				x_mult = 1,
				x_mult_gain = 0.25,
			}
		},

		set_badges = function(self, card, badges)
			JOAF.reference_badge(card, badges, "deltarune")
		end,
		
		-- Variables to be used in the loc_txt area
		loc_vars = function(self, info_queue, card)
			return {
				vars = {
					card.ability.extra.x_mult,
					card.ability.extra.x_mult_gain,
					card.ability.extra.x_mult_gain * 2,
					card.ability.extra.x_mult_gain * 8,
				}
			}
		end,

		-- look at wiki for info i aint writing it down here
		calculate = function(self, card, context)
			if context.end_of_round and context.cardarea == G.jokers then
				if JOAF.is_showdown_blind(G.GAME.round_resets.blind.key) then
					card.ability.extra.x_mult = card.ability.extra.x_mult + card.ability.extra.x_mult_gain * 8
					return { message = "Upgrade!" }
				elseif G.GAME.round_resets.blind.boss then
					card.ability.extra.x_mult = card.ability.extra.x_mult + card.ability.extra.x_mult_gain * 2
					return { message = "Upgrade!" }
				else
					card.ability.extra.x_mult = card.ability.extra.x_mult + card.ability.extra.x_mult_gain
					return { message = "Upgrade!" }
				end
			end
			if context.joker_main then
				return {
					x_mult = card.ability.extra.x_mult
				}
			end
		end
	}
end