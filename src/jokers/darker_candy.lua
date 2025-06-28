SMODS.Joker {
	key = "darker_candy",			-- Object ID, acessed with j_joaf_[key]
	atlas = "JOAFJokers",		-- Spritesheet to use, initalized in main script
	pos = {x = 8, y = 4},		-- works on a +1 increment, not based off of pixels
	rarity = 2,					-- 1-Common | 2-Uncommon | 3-Rare | 4-Legendary, string id for modded rarities, found in main script
	cost = 6,					-- shop price
	pools = {
		["JOAFJokers"] = true,
		["Food"] = true
	},
	blueprint_compat = true,	-- Cosmetic only, define in calculate function
	eternal_compat = true,		-- Self Explanatory
	perishable_compat = true,

	unlocked = true,			-- Do not change these, they make the jokers visible on mod download
	discovered = false,

	-- Display text
	loc_txt = {
		name = "Darker Candy",
		text = {
			"{C:chips}+#1#{} chips",
		}
	},

	set_badges = function(self, card, badges)
		JOAF.reference_badge(card, badges, "deltarune")
	end,

	-- Variables used in loc_vars and calculate
	config = {
		extra = {
			chips = 120,
		}
	},

	-- Variables to be used in the loc_txt area
	loc_vars = function(self, info_queue, card)
		return { vars = {
			card.ability.extra.chips,
		}}
	end,

	in_pool = function(self, args)
        return false, { allow_duplicates = false }
    end,

	-- look at wiki for info i aint writing it down here
	calculate = function(self, card, context)
		if context.joker_main then
			return {
				chips = card.ability.extra.chips
			}
		end
	end
}