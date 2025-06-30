SMODS.Joker {
	key = "cloudy_joker",			-- Object ID, acessed with j_joaf_[key]
	atlas = "JOAFJokers",		-- Spritesheet to use, initalized in main script
	pos = {x = 5, y = 5},		-- works on a +1 increment, not based off of pixels
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
		name = "Cloudy Joker",
		text = {
			"Gain {X:chips,C:white}X#1#{} chips when a",
			"{C:attention}Lightweight{} Card is scored",
			"{C:inactive}(Currently {X:chips,C:white}X#2#{C:inactive} chips)"
		}
	},

	-- Variables used in loc_vars and calculate
	config = {
		extra = {
			gain = 0.1,
			x_chips = 1,
		}
	},
	-- Variables to be used in the loc_txt area
	loc_vars = function(self, info_queue, card)
		info_queue[#info_queue+1] = G.P_CENTERS.m_joaf_lightweight
		return {
			vars = {
				card.ability.extra.gain,
				card.ability.extra.x_chips,
			}
		}
	end,

	-- look at wiki for info i aint writing it down here
	calculate = function(self, card, context)
		if context.cardarea == G.play and context.individual then
			if SMODS.has_enhancement(context.other_card, "m_joaf_lightweight") then
				card.ability.extra.x_chips = card.ability.extra.x_chips + card.ability.extra.gain
				return {
					message_card = card,
					message = 'Upgraded!',
					colour = G.C.CHIPS
				}
			end
		end
		if context.joker_main then
			return {
				x_chips = card.ability.extra.x_chips
			}
		end
	end,

}