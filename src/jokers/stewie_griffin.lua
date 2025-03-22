SMODS.Joker {
	key = 'stewie_griffin',
	atlas = 'JOAFJokers',
	pos = { x = 11, y = 0 }, -- works on a +1 increment, not based off of pixels
	rarity = "joaf_family", -- 1: common, 2: uncommon, 3: rare, 4: legendary
	cost = 20,

	loc_txt = {
		name = 'Stewie Griffin',
		text = {
			--[[
				{C:} 	- color modifier
				{} 		- reset all formatting
				{X:}	- sets the background, usually used for XMult.
				{s:}	- scale, and multiplies the text size by the value, like 0.8
				{V:1}	- allows for a variable to dynamically change the color
			]]
			"Levels up the played",
			"hand by {C:attention}#1#{}",
			"{C:inactive,s:0.9}(But where are those good{}",
			"{C:inactive,s:0.9}old-fashion values)",
		}
	},

	config = {
		extra = {
			level_ups = 1,
		}
	},

	loc_vars = function(self, info_queue, card)
		return {
			vars = {
				card.ability.extra.level_ups
			}
		}
	end,

	calculate = function(self, card, context)
		if context.joker_main then
			return {
				level_up = card.ability.extra.level_ups,
				card = card
			}
		end
	end
}