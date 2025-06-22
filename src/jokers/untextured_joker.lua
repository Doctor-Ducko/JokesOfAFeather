SMODS.Joker {
	key = "untextured_joker",			-- Object ID, acessed with j_joaf_[key]
	atlas = "JOAFJokers",		-- Spritesheet to use, initalized in main script
	pos = {x = 10, y = 4},		-- works on a +1 increment, not based off of pixels
	rarity = 2,					-- 1-Common | 2-Uncommon | 3-Rare | 4-Legendary, string id for modded rarities, found in main script
	cost = 7,					-- shop price

	blueprint_compat = true,	-- Cosmetic only, define in calculate function
	eternal_compat = true,		-- Self Explanatory
	perishable_compat = true,

	unlocked = true,			-- Do not change these, they make the jokers visible on mod download
	discovered = false,

	-- Display text
	loc_txt = {
		name = "Untextured Joker",
		text = {
			"Gives {X:chips,C:white}X#1#{} Chips for",
			"every {C:attention}Untextured Card{}",
			"in your deck",
			"{C:inactive}(Currently {X:chips,C:white}X#2#{C:inactive} Chips)"
		}
	},

	-- Variables used in loc_vars and calculate
	config = {
		extra = {
			x_chips_per = 0.25,
		}
	},
	-- Variables to be used in the loc_txt area
	loc_vars = function(self, info_queue, card)
		info_queue[#info_queue+1] = G.P_CENTERS.m_joaf_untextured
		return {
			vars = {
				card.ability.extra.x_chips_per,
				self.update_x_chips(self, card)
			}
		}
	end,

	-- look at wiki for info i aint writing it down here
	calculate = function(self, card, context)
		if context.joker_main then
			self.update_x_chips(self, card)
			return {
				x_chips = self.update_x_chips(self, card)
			}
		end
	end,

	update_x_chips = function(self, card)
		return 1 + (JOAF.count_cards_of_enhancement("m_joaf_untextured") * card.ability.extra.x_chips_per)
	end,

	in_pool = function(self, args) -- enhancement gate thank you VanillaRemade at https://github.com/nh6574/VanillaRemade
        return JOAF.count_cards_of_enhancement("m_joaf_untextured") > 0
    end
}