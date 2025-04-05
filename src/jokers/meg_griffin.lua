SMODS.Joker {
	key = 'meg_griffin',
	atlas = 'JOAFJokers',
	pos = { x = 1, y = 0 }, -- works on a +1 increment, not based off of pixels
	rarity = "joaf_family", -- 1: common, 2: uncommon, 3: rare, 4: legendary
	cost = 20,

	loc_txt = {
		name = 'Meg Griffin',
		text = {
			--[[
				{C:} 	- color modifier
				{} 		- reset all formatting
				{X:}	- sets the background, usually used for XMult.
				{s:}	- scale, and multiplies the text size by the value, like 0.8
				{V:1}	- allows for a variable to dynamically change the color
			]]
			"All {C:hearts}Heart{} cards score",
			"{C:chips}+#1#{} chips",
			"{C:inactive,s:0.9}(And sex on TV)",
		}
	},

	config = {
		extra = {
			chips = 100,
		}
	},

	loc_vars = function(self, info_queue, card)
		return {
			vars = {
				card.ability.extra.chips
			}
		}
	end,

	calculate = function(self, card, context)
		if context.individual and context.cardarea == G.play then
			if context.other_card:is_suit("Hearts") then
				return {
					chips = card.ability.extra.chips,
					card = context.other_card
				}
			end
		end
	end
}