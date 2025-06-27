SMODS.Joker {
	key = "jokerjoker",			-- Object ID, acessed with j_joaf_[key]
	atlas = "JOAFJokers",		-- Spritesheet to use, initalized in main script
	pos = {x = 11, y = 4},		-- works on a +1 increment, not based off of pixels
	rarity = 3,					-- 1-Common | 2-Uncommon | 3-Rare | 4-Legendary, string id for modded rarities, found in main script
	cost = 10,					-- shop price

	blueprint_compat = true,	-- Cosmetic only, define in calculate function
	eternal_compat = true,		-- Self Explanatory
	perishable_compat = true,

	unlocked = true,			-- Do not change these, they make the jokers visible on mod download
	discovered = false,

	-- Display text
	loc_txt = {
		name = "JokerJoker",
		text = {
			"Gives {C:mult}+Factorial{} Mult",
			"for each {C:red}Discard{} left",
			"{C:inactive}(Currently {C:mult}+#1#!{C:inactive} Mult{}",
			"{C:inactive}(\"!\" is the factorial function)",
			"{C:inactive}(Ex: 5! = 5 * 4 * 3 * 2 * 1)",
		}
	},
	-- Variables to be used in the loc_txt area
	loc_vars = function(self, info_queue, card)
		return {
			vars = {
				G.GAME.current_round.discards_left
			}
		}
	end,

	-- look at wiki for info i aint writing it down here
	calculate = function(self, card, context)
		if context.joker_main then
			return {
				mult = JOAF.factorial(G.GAME.current_round.discards_left or 1)
			}
		end
	end
}