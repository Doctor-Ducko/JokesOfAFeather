SMODS.Joker {
	key = 'brian_griffin',
	atlas = 'JOAFJokers',
	pos = { x = 0, y = 1 }, -- works on a +1 increment, not based off of pixels
	rarity = "joaf_family", -- 1: common, 2: uncommon, 3: rare, 4: legendary
	cost = 20,

	loc_txt = {
		name = 'Brian Griffin',
		text = {
			--[[
				{C:} 	- color modifier
				{} 		- reset all formatting
				{X:}	- sets the background, usually used for XMult.
				{s:}	- scale, and multiplies the text size by the value, like 0.8
				{V:1}	- allows for a variable to dynamically change the color
			]]
			"{C:mult}+#2#{} Mult after",
			"discarding {C:attention}#4# {C:inactive}(#3#) cards",
			"{C:inactive}(Currently {C:mult}+#1#{}{C:inactive} Mult)",
			"{C:inactive,s:0.9}(On which we used to rely)",
		}
	},

	config = {
		extra = {
			mult = 0,
			mult_increase = 5,
			cards_left = 5,
			cards_required = 5,
		}
	},

	loc_vars = function(self, info_queue, card)
		return {
			vars = {
				card.ability.extra.mult,
				card.ability.extra.mult_increase,
				card.ability.extra.cards_left,
				card.ability.extra.cards_required,
			}
		}
	end,

	calculate = function(self, card, context)
		if context.discard and not context.blueprint then
			card.ability.extra.mult = card.ability.extra.mult + card.ability.extra.mult_increase
			return {
				message = 'Upgraded!',
				colour = G.C.MULT,
				card = card
			}
		end
		if context.joker_main then
			return {
				mult_mod = card.ability.extra.mult,
				message = localize { type = 'variable', key = 'a_mult', vars = { card.ability.extra.mult } },
				card = card
			}
		end
	end
}