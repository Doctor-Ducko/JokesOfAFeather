SMODS.Joker {
	key = 'picture_frame',			-- Object ID, acessed with j_joaf_[key]
	atlas = 'JOAFJokers',		-- Spritesheet to use, initalized in main script
	pos = {x = 8, y = 1},		-- works on a +1 increment, not based off of pixels
	rarity = 3,					-- 1-Common | 2-Uncommon | 3-Rare | 4-Legendary, string id for modded rarities, found in main script
	cost = 5,					-- shop price

	blueprint_compat = true,	-- Cosmetic only, define in calculate function
	eternal_compat = true,		-- Self Explanatory
	perishable_compat = true,

	unlocked = true,			-- Do not change these, they make the jokers visible on mod download
	discovered = true,

	-- Display text
	loc_txt = {
		name = 'Picture Frame',
		text = {
			"First played {C:attention}number{}",
			"card gives {X:chips,C:white}X#1#{} chips",
			"when scored",
		}
	},

	-- Variables used in loc_vars and calculate
	config = {
		extra = {
			x_chips = 2
		}
	},
	-- Variables to be used in the loc_txt area
	loc_vars = function(self, info_queue, card)
		return {
			vars = {
				card.ability.extra.x_chips
			}
		}
	end,

	-- look at wiki for info i aint writing it down here
	calculate = function(self, card, context)
		if context.individual and context.cardarea == G.play then
			local first_number = nil
			for i = 1, #context.scoring_hand do
				if not context.scoring_hand[i]:is_face() then
					first_number = context.scoring_hand[i];
					break 
				end
			end
			if context.other_card == first_number then
				return {
					x_chips = card.ability.extra.x_chips
				}
			end
		end
	end
}