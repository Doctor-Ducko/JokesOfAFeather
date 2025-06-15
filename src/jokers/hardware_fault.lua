SMODS.Joker {
	key = "hardware_fault",			-- Object ID, acessed with j_joaf_[key]
	atlas = "JOAFJokers",		-- Spritesheet to use, initalized in main script
	pos = {x = 6, y = 4},		-- works on a +1 increment, not based off of pixels
	rarity = 2,					-- 1-Common | 2-Uncommon | 3-Rare | 4-Legendary, string id for modded rarities, found in main script
	cost = 6,					-- shop price

	blueprint_compat = true,	-- Cosmetic only, define in calculate function
	eternal_compat = true,		-- Self Explanatory
	perishable_compat = true,

	unlocked = true,			-- Do not change these, they make the jokers visible on mod download
	discovered = false,

	-- Display text
	loc_txt = {
		name = "Hardware Fault",
		text = {
			"Gives between {X:attention,C:white}X#1#{} and {X:attention,C:white}X#2#{}",
			"{C:chips}Chips{} or {C:mult}Mult{}"
		}
	},

	-- Variables used in loc_vars and calculate
	config = {
		extra = {
			low = 0.9,
			high = 2,
		}
	},
	-- Variables to be used in the loc_txt area
	loc_vars = function(self, info_queue, card)
		return {
			vars = {
				card.ability.extra.low,
				card.ability.extra.high,
			}
		}
	end,

	-- look at wiki for info i aint writing it down here
	calculate = function(self, card, context)
		if context.joker_main then
			return {
				x_mult =  pseudorandom("j_joaf_hardware_fault_mult",  card.ability.extra.low, card.ability.extra.high),
				x_chips = pseudorandom("j_joaf_hardware_fault_chips", card.ability.extra.low, card.ability.extra.high)
			}
		end
	end
}