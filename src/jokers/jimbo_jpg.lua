SMODS.Joker {
	key = 'jimbo_jpg',			-- Object ID, acessed with j_joaf_[key]
	atlas = 'JOAFJokers',		-- Spritesheet to use, initalized in main script
	pos = {x = 2, y = 2},		-- works on a +1 increment, not based off of pixels
	rarity = 2,					-- 1-Common | 2-Uncommon | 3-Rare | 4-Legendary, string id for modded rarities, found in main script
	cost = 7,					-- shop price

	blueprint_compat = true,	-- Cosmetic only, define in calculate function
	eternal_compat = true,		-- Self Explanatory
	perishable_compat = true,

	unlocked = true,			-- Do not change these, they make the jokers visible on mod download
	discovered = false,

	-- Display text
	loc_txt = {
		name = 'jimbo.jpg',
		text = {
			"Scored cards lose {C:blue}#1#{} chip",
			"and gain {C:mult}+#2#{} bonus Mult",
			"when scored",
			"{C:attention}NOTICE{}: Chips can go negative, be careful!"
		}
	},

	-- Variables used in loc_vars and calculate
	config = {
		extra = {
			perma_chips = -1,
			perma_mult = 1,
		}
	},
	-- Variables to be used in the loc_txt area
	loc_vars = function(self, info_queue, card)
		return {
			vars = {
				card.ability.extra.perma_chips * -1,
				card.ability.extra.perma_mult,
			}
		}
	end,

	-- look at wiki for info i aint writing it down here
	calculate = function(self, card, context)
		if context.individual and context.cardarea == G.play then
			context.other_card.ability.perma_bonus = context.other_card.ability.perma_bonus + card.ability.extra.perma_chips
			context.other_card.ability.perma_mult = context.other_card.ability.perma_mult + card.ability.extra.perma_mult
			return {
				message = 'Trade-off',
				colour = G.C.MULT,
				card = card
			}
		end
	end
}