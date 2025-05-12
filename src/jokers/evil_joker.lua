SMODS.Joker {
	key = 'evil_joker',			-- Object ID, acessed with j_joaf_[key]
	atlas = 'JOAFJokers',		-- Spritesheet to use, initalized in main script
	pos = {x = 4, y = 0},		-- works on a +1 increment, not based off of pixels
	rarity = 3,					-- 1-Common | 2-Uncommon | 3-Rare | 4-Legendary, string id for modded rarities, found in main script
	cost = 8,					-- shop price

	blueprint_compat = true,	-- Cosmetic only, define in calculate function
	eternal_compat = true,		-- Self Explanatory
	perishable_compat = true,

	unlocked = true,			-- Do not change these, they make the jokers visible on mod download
	discovered = false,

	-- Display text
	loc_txt = {
		name = 'EVIL Joker',
		text = {
			"If scored hand is a",
			"{C:attention}Three of a Kind{} with",
			"{C:attention}3 6's{}, gain {X:mult,C:white}X#1#{} Mult",
		}
	},

	-- Variables used in loc_vars and calculate
	config = {
		extra = {
			x_mult = 6
		}
	},
	-- Variables to be used in the loc_txt area
	loc_vars = function(self, info_queue, card)
		return {
			vars = {
				card.ability.extra.x_mult
			}
		}
	end,

	-- look at wiki for info i aint writing it down here
	calculate = function(self, card, context)
		if context.joker_main and next(context.poker_hands['Three of a Kind']) then
			local three_threes = 0
			for k,v in ipairs(context.scoring_hand) do
				if v:get_id() == 6 then
					three_threes = three_threes + 1
				end
			end
			if three_threes == 3 then
				return {
					x_mult = card.ability.extra.x_mult
				}
			else
				return {}
			end
		end
	end
}