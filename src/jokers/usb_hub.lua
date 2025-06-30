SMODS.Joker {
	key = "usb_hub",			-- Object ID, acessed with j_joaf_[key]
	atlas = "JOAFJokers",		-- Spritesheet to use, initalized in main script
	pos = {x = 1, y = 5},		-- works on a +1 increment, not based off of pixels
	rarity = 1,					-- 1-Common | 2-Uncommon | 3-Rare | 4-Legendary, string id for modded rarities, found in main script
	cost = 5,					-- shop price
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
		name = "USB Hub",
		text = {
			"{C:attention}+#1#{} Consumable slots",
		}
	},

	-- Variables used in loc_vars and calculate
	config = {
		extra = {
			consumable_slots = 2
		}
	},

	
	-- Variables to be used in the loc_txt area
	loc_vars = function(self, info_queue, card)
		return {
			vars = {
				card.ability.extra.consumable_slots
			}
		}
	end,

	add_to_deck = function(self, card, from_debuff)
		G.consumeables.config.card_limit = G.consumeables.config.card_limit + card.ability.extra.consumable_slots
	end,
	remove_from_deck = function(self, card, from_debuff)
		G.consumeables.config.card_limit = G.consumeables.config.card_limit - card.ability.extra.consumable_slots
	end,
}