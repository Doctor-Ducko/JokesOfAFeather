SMODS.Joker {
	key = "house_like_carpet",	-- Object ID, acessed with j_joaf_[key]
	atlas = "JOAFJokers",		-- Spritesheet to use, initalized in main script
	pos = {x = 3, y = 4},		-- works on a +1 increment, not based off of pixels
	rarity = 3,					-- 1-Common | 2-Uncommon | 3-Rare | 4-Legendary, string id for modded rarities, found in main script
	cost = 10,					-- shop price
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
		name = "House like Carpet",
		text = {
			"{C:enhanced,E:1}Balances{C:chips} Chips{} and{C:mult} Mult",
			"if played hand contains",
			"a {C:attention}Full House{}"
		}
	},

	set_badges = function(self, card, badges)
		JOAF.reference_badge(card, badges, "toby_fox")
	end,

	-- look at wiki for info i aint writing it down here
	calculate = function(self, card, context)
		if context.final_scoring_step and next(context.poker_hands["Full House"]) then
			play_sound("joaf_carpet")
			JOAF.plasma_balance()
		end
	end
}