SMODS.Joker {
	key = 'chris_griffin',
	atlas = 'JOAFJokers',
	pos = { x = 8, y = 0 }, -- works on a +1 increment, not based off of pixels
	rarity = "joaf_family", -- 1: common, 2: uncommon, 3: rare, 4: legendary
	cost = 20,
	pools = {
		["JOAFJokers"] = true
	},
	blueprint_compat = false,

	loc_txt = {
		name = 'Chris Griffin',
		text = {
			--[[
				{C:} 	- color modifier
				{} 		- reset all formatting
				{X:}	- sets the background, usually used for XMult.
				{s:}	- scale, and multiplies the text size by the value, like 0.8
				{V:1}	- allows for a variable to dynamically change the color
			]]
			"{C:attention}+#1# Joker{} slots",
			"{C:inactive,s:0.9}(Is violence in movies)",
		}
	},

	config = {
		extra = {
			joker_slots = 3
		}
	},

	loc_vars = function(self, info_queue, card)
		return {
			vars = {
				card.ability.extra.joker_slots
			}
		}
	end,

	add_to_deck = function(self, card, from_debuff)
		G.jokers.config.card_limit = G.jokers.config.card_limit + card.ability.extra.joker_slots
	end,
	remove_from_deck = function(self, card, from_debuff)
		G.jokers.config.card_limit = G.jokers.config.card_limit - card.ability.extra.joker_slots
	end,
}