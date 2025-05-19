SMODS.Joker {
	key = "57_leaf_clover",			-- Object ID, acessed with j_joaf_[key]
	atlas = "JOAFJokers",		-- Spritesheet to use, initalized in main script
	pos = {x = 4, y = 3},		-- works on a +1 increment, not based off of pixels
	rarity = 3,					-- 1-Common | 2-Uncommon | 3-Rare | 4-Legendary, string id for modded rarities, found in main script
	cost = 8,					-- shop price

	blueprint_compat = false,	-- Cosmetic only, define in calculate function
	eternal_compat = true,		-- Self Explanatory
	perishable_compat = true,

	unlocked = true,			-- Do not change these, they make the jokers visible on mod download
	discovered = false,

	-- Display text
	loc_txt = {
		name = "57 Leaf Clover",
		text = {
			"{C:attention}Triples{} all {C:attention}listed",
			"{C:green,E:1,S:1.1}probabilities",
			"{C:inactive}(ex: {C:green}1 in 3{C:inactive} -> {C:green}3 in 3{C:inactive})",
		}
	},

	set_badges = function(self, card, badges)
		JOAF.credit_badge(card, badges, "Chilli", G.C.CHILLI)
	end,

	-- Variables used in loc_vars and calculate
	config = {
		extra = {

		}
	},

	loc_vars = function(self, info_queue, card)
		return {
			vars = {
			}
		}
	end,

	add_to_deck = function(self, card, from_debuff)
		for k, v in pairs(G.GAME.probabilities) do 
			G.GAME.probabilities[k] = v*3
		end
	end,
	
	remove_from_deck = function(self, card, from_debuff)
		for k, v in pairs(G.GAME.probabilities) do 
			G.GAME.probabilities[k] = v/3
		end
	end,

	-- look at wiki for info i aint writing it down here
	calculate = function(self, card, context)
	end
}