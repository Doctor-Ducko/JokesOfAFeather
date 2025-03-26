SMODS.Joker {
	key = 'joker_qm',
	atlas = 'JOAFJokers',
	pos = { x = 3, y = 1 }, -- works on a +1 increment, not based off of pixels
	rarity = 1, -- 1: common, 2: uncommon, 3: rare, 4: legendary
	cost = 3,
	blueprint_compat = true,

	loc_txt = {
		name = 'Joker?',
		text = {
			"{C:chips}+#1#{} chips"
		}
	},

	config = {
		extra = {
			chips = 50
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
		if context.joker_main then
			return {
				chips = card.ability.extra.chips,
				card = context.other_card
			}
		end
	end
}
