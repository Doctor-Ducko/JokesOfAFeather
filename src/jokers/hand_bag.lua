SMODS.Joker {
	key = "hand_bag",			-- Object ID, acessed with j_joaf_[key]
	atlas = "JOAFJokers",		-- Spritesheet to use, initalized in main script
	pos = {x = 4, y = 5},		-- works on a +1 increment, not based off of pixels
	rarity = 1,					-- 1-Common | 2-Uncommon | 3-Rare | 4-Legendary, string id for modded rarities, found in main script
	cost = 5,					-- shop price
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
		name = "Hand Bag",
		text = {
			"Gains {C:chips}+#1#{} Chips per {C:blue}hand",
			"remaining when defeating a Blind",
			"{C:inactive}(Currently {C:chips}+#2#{C:inactive} Chips)"
		}
	},

	-- Variables used in loc_vars and calculate
	config = {
		extra = {
			gain = 5,
			chips = 0
		}
	},

	set_badges = function(self, card, badges)
		--JOAF.reference_badge(card, badges, "deltarune")
	end,
	
	-- Variables to be used in the loc_txt area
	loc_vars = function(self, info_queue, card)
		return {
			vars = {
				card.ability.extra.gain,
				card.ability.extra.chips,
			}
		}
	end,

	-- look at wiki for info i aint writing it down here
	calculate = function(self, card, context)
		if context.joker_main then
			return {
				chips = card.ability.extra.chips
			}
		end
		if context.end_of_round and context.cardarea == G.jokers then
			card.ability.extra.chips = card.ability.extra.chips + (G.GAME.current_round.hands_left * card.ability.extra.gain)
			return {
				message = "Upgraded!",
				colour = G.GAME.CHIPS
			}
		end
	end
}