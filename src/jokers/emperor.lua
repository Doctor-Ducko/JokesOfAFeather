SMODS.Joker {
	key = 'emperor',			-- Object ID, acessed with j_joaf_[key]
	atlas = 'JOAFJokers',		-- Spritesheet to use, initalized in main script
	pos = {x = 5, y = 2},		-- works on a +1 increment, not based off of pixels
	soul_pos = { x = 1, y = 2 },
	rarity = 4,					-- 1-Common | 2-Uncommon | 3-Rare | 4-Legendary, string id for modded rarities, found in main script
	cost = 20,					-- shop price

	blueprint_compat = true,	-- Cosmetic only, define in calculate function
	eternal_compat = true,		-- Self Explanatory
	perishable_compat = true,

	unlocked = true,			-- Do not change these, they make the jokers visible on mod download
	discovered = true,

	-- Display text
	loc_txt = {
		name = 'Emperor',
		text = {
			"Gains {X:dark_edition,C:white}^#1#{} Mult when a",
			"face card is scored",
			"{C:inactive}(Currently {X:dark_edition,C:white}^#2#{}{C:inactive} Mult)",
		}
	},

	-- Variables used in loc_vars and calculate
	config = {
		extra = {
			e_mult_increase = 0.025,
			e_mult = 1,
		}
	},
	-- Variables to be used in the loc_txt area
	loc_vars = function(self, info_queue, card)
		return {
			vars = {
				card.ability.extra.e_mult_increase,
				card.ability.extra.e_mult,
			}
		}
	end,

	-- look at wiki for info i aint writing it down here
	calculate = function(self, card, context)
		if context.individual and context.cardarea == G.play and not context.blueprint then
			local face = context.other_card:is_face()
			if face then
				card.ability.extra.e_mult = card.ability.extra.e_mult + card.ability.extra.e_mult_increase
				return {
					message = "Upgrade!",
					colour = G.C.MULT
				}
			end
		end
		if context.joker_main then
			return {
				e_mult = card.ability.extra.e_mult
			}
		end
	end
}