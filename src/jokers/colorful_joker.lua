SMODS.Joker {
	key = "colorful_joker",			-- Object ID, acessed with j_joaf_[key]
	atlas = "JOAFJokers",		-- Spritesheet to use, initalized in main script
	pos = {x = 9, y = 3},		-- works on a +1 increment, not based off of pixels
	rarity = 2,					-- 1-Common | 2-Uncommon | 3-Rare | 4-Legendary, string id for modded rarities, found in main script
	cost = 7,					-- shop price

	blueprint_compat = true,	-- Cosmetic only, define in calculate function
	eternal_compat = true,		-- Self Explanatory
	perishable_compat = true,

	unlocked = true,			-- Do not change these, they make the jokers visible on mod download
	discovered = false,

	-- Display text
	loc_txt = {
		name = "Colorful Joker",
		text = {
			"Retrigger all scored {V:1}#1#{} cards once",
			"{C:inactive}(Suit changes at the end of round)"
		}
	},

	-- Variables used in loc_vars and calculate
	config = {
		extra = {
			retriggers = 1
		}
	},
	-- Variables to be used in the loc_txt area
	loc_vars = function(self, info_queue, card)
		return {
			vars = {
				localize(G.GAME.current_round.colorful_joker.suit, 'suits_singular'), -- gets the localized name of the suit
				colours = { G.C.SUITS[G.GAME.current_round.colorful_joker.suit] } -- sets the colour of the text affected by `{V:1}`
			}
		}
	end,

	-- look at wiki for info i aint writing it down here
	calculate = function(self, card, context)
		if context.cardarea == G.play and context.repetition and not context.repetition_only then
			if context.other_card:is_suit(G.GAME.current_round.colorful_joker.suit) then
				return {
					message = 'Again!',
					repetitions = card.ability.extra.retriggers,
					card = context.other_card
				}
			end
		end
	end,

}