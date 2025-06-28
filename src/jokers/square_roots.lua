SMODS.Joker {
	key = 'square_roots',
	atlas = 'JOAFJokers',
	pos = { x = 11, y = 3 }, -- works on a +1 increment, not based off of pixels
	rarity = 2, -- 1: common, 2: uncommon, 3: rare, 4: legendary
	cost = 5,
	pools = {
		["JOAFJokers"] = true
	},

	loc_txt = {
		name = 'Square Roots',
		text = {
			--[[
				{C:} 	- color modifier
				{} 		- reset all formatting
				{X:}	- sets the background, usually used for XMult.
				{s:}	- scale, and multiplies the text size by the value, like 0.8
				{V:1}	- allows for a variable to dynamically change the color
			]]
			"Played {C:attention}Aces{}, {C:attention}4s{}, and {C:attention}9s{}",
			"score {X:mult,C:white}X#1#{} Mult",
		}
	},

	config = {
		extra = {
			x_mult = 1.5,
		}
	},

	loc_vars = function(self, info_queue, card)
		return {
			vars = {
				card.ability.extra.x_mult
			}
		}
	end,

	calculate = function(self, card, context)
		if context.individual and context.cardarea == G.play then
			if context.other_card:get_id() == 14 or context.other_card:get_id() == 4 or context.other_card:get_id() == 9 then
				return {
					x_mult = card.ability.extra.x_mult
				}
			end
		end
	end
}