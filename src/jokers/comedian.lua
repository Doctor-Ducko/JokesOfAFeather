SMODS.Joker {
	key = 'comedian',			-- Object ID, acessed with j_joaf_[key]
	atlas = 'JOAFJokers',		-- Spritesheet to use, initalized in main script
	pos = {x = 0, y = 0},		-- works on a +1 increment, not based off of pixels
	rarity = 3,					-- 1-Common | 2-Uncommon | 3-Rare | 4-Legendary, string id for modded rarities, found in main script
	cost = 10,					-- shop price

	blueprint_compat = true,	-- Cosmetic only, define in calculate function
	eternal_compat = true,		-- Self Explanatory
	perishable_compat = true,

	unlocked = true,			-- Do not change these, they make the jokers visible on mod download
	discovered = true,

	-- Display text
	loc_txt = {
		name = 'Comedian',
		text = {
			"{C:inactive}({C:chips}+#1#{}{C:inactive} & {X:chips,C:white}X#3#{}{C:inactive} chips, {C:mult}+#2#{}{C:inactive} & {X:mult,C:white}X#4#{}{C:inactive} Mult)",
		}
	},

	-- Variables used in loc_vars and calculate
	config = {
		extra = {
			chips 		= 20,
			mult 		= 20,
			x_chips 	= 21,
			x_mult 		= 21,
			chips_inc 	= 50,
			mult_inc 	= 8,
			x_chips_inc = 0.1,
			x_mult_inc	= 0.2,
		}
	},
	-- Variables to be used in the loc_txt area
	loc_vars = function(self, info_queue, card)
		return {
			vars = {
				card.ability.extra.chips,
				card.ability.extra.mult,
				card.ability.extra.x_chips,
				card.ability.extra.x_mult,
			}
		}
	end,

	-- look at wiki for info i aint writing it down here
	calculate = function(self, card, context)
		if context.joker_main then
			return {
				chips	= card.ability.extra.chips,
				mult 	= card.ability.extra.mult,
				x_chips = card.ability.extra.x_chips,
				x_mult 	= card.ability.extra.x_mult
			}
		end
	end
}