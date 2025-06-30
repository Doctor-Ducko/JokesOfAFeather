SMODS.Joker {
	key = "glenn_quagmire",			-- Object ID, acessed with j_joaf_[key]
	atlas = "JOAFJokers",		-- Spritesheet to use, initalized in main script
	pos = {x = 9, y = 4},		-- works on a +1 increment, not based off of pixels
	rarity = "joaf_family",					-- 1-Common | 2-Uncommon | 3-Rare | 4-Legendary, string id for modded rarities, found in main script
	cost = 20,					-- shop price
	pools = {
		["JOAFJokers"] = true
	},

	blueprint_compat = false,	-- Cosmetic only, define in calculate function
	eternal_compat = true,		-- Self Explanatory
	perishable_compat = true,

	unlocked = true,			-- Do not change these, they make the jokers visible on mod download
	discovered = false,

	-- Display text
	loc_txt = {
		name = "Glenn Quagmire",
		text = {
			"Play {C:blue}#1#{} extra cards",
			"Discard {C:red}#2#{} extra cards",
		}
	},

	-- Variables used in loc_vars and calculate
	config = {
		extra = {
			play_limit = 3,
			discard_limit = 3,
		}
	},
	-- Variables to be used in the loc_txt area
	loc_vars = function(self, info_queue, card)
		return {
			vars = {
				card.ability.extra.play_limit,
				card.ability.extra.discard_limit,
			}
		}
	end,

	add_to_deck = function(self, card, from_debuff)
        SMODS.change_play_limit(card.ability.extra.play_limit)
        SMODS.change_discard_limit(card.ability.extra.discard_limit)
	end,
	-- Inverse of above function.
	remove_from_deck = function(self, card, from_debuff)
        SMODS.change_play_limit(-card.ability.extra.play_limit)
        SMODS.change_discard_limit(-card.ability.extra.discard_limit)
	end
}