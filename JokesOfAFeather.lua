SMODS.Atlas {
    key = "JOAFJokers",
    path = "joaf_jokers.png",
	px = 71,
	py = 95
}

SMODS.Joker {
	key = 'meg_griffin',
	loc_txt = {
		name = 'Meg Griffin',
		text = {
			--[[
				{C:} 	- color modifier
				{} 		- reset all formatting
				{X:}	- sets the background, usually used for XMult.
				{s:}	- scale, and multiplies the text size by the value, like 0.8
				{V:1}	-It allows for a variable to dynamically change the color. You can find an example in the Castle joker if needed.
			]]
			"All Heart Cards score {C:chips}+#1#{} Chips"
		}
	},
	config = {
		extra = {
			chips = 200
		}
	},

	-- loc_vars gives your loc_text variables to work with, in the format of #n#, n being the variable in order.
	loc_vars = function(self, info_queue, card)
		return {
			vars = {
				card.ability.extra.chips
			}
		}
	end,
	rarity = 4, -- 1: common, 2: uncommon, 3: rare, 4: legendary
	atlas = 'JOAFJokers',
	pos = { x = 1, y = 0 }, -- works on a +1 increment, not based off of pixels
	cost = 2,
	calculate = function(self, card, context)
		if context.joker_main then
			return {
				chip_mod = card.ability.extra.chip,
				message = localize{
					type = 'variable',
					key = 'a_chip',
					vars = {card.ability.extra.chip}
				}
			}
		end
	end
}

SMODS.Joker {
	key = "straight_line",

	loc_txt = {
		name = "Straight Line",
		text = {
			"Gains {X:mult,C:white} X#2# {} Mult",
			"if played hand",
			"contains a {C:attention}Straight{}",
			"{C:inactive}(Currently {X:mult,C:white}X#1#{}{C:inactive} Mult)"
		}
	},

	rarity = 2, -- 1: common, 2: uncommon, 3: rare, 4: legendary
	atlas = 'JOAFJokers',
	pos = { x = 2, y = 0 }, -- works on a +1 increment, not based off of pixels
	cost = 2,

	config = {
		extra = {
			Xmult = 1,
			Xmult_gain = 0.15
		}
	},

	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.Xmult, card.ability.extra.Xmult_gain } }
	end,

	calculate = function(self, card, context)
		if context.joker_main then
			return {
				Xmult_mod = card.ability.extra.Xmult,
				message = localize { type = 'variable', key = 'a_xmult', vars = { card.ability.extra.Xmult } }
			}
		end
		if context.before and next(context.poker_hands['Straight']) and not context.blueprint then
			card.ability.extra.Xmult = card.ability.extra.Xmult + card.ability.extra.Xmult_gain
			return {
				message = 'Upgraded!',
				colour = G.C.XMULT,
				card = card
			}
		end
	end
}

SMODS.Joker {
	key = "misplaced",

	loc_txt = {
		name = "Misplaced",
		text = {
			"Gain {C:blue}+#1#{} hand",
			"per round"
		}
	},

	rarity = 2, -- 1: common, 2: uncommon, 3: rare, 4: legendary
	atlas = 'JOAFJokers',
	pos = { x = 5, y = 0 }, -- works on a +1 increment, not based off of pixels
	cost = 7,

	config = {
		extra = {
			hand_size = 1,
		}
	},

	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.hand_size } }
	end,

	add_to_deck = function(self, card, from_debuff)
		G.GAME.round_resets.hands = G.GAME.round_resets.hands + card.ability.extra.hand_size
	end,
	-- Inverse of above function.
	remove_from_deck = function(self, card, from_debuff)
		G.GAME.round_resets.hands = G.GAME.round_resets.hands - card.ability.extra.hand_size
	end
}

SMODS.Back{
    name = "Test Deck",
    key = "test_deck",
    pos = {x = 0, y = 3},
    config = {},
    loc_txt = {
        name = "Test Deck",
        text ={
            "Test"
        },
    },
	apply = function(self, back)
		delay(0.4)
		G.E_MANAGER:add_event(Event({
			func = function()
				local dna_card = create_card("Joker", G.jokers, nil, nil, nil, nil, "j_joaf_meg_griffin", "deck")
				dna_card:set_edition({ negative = true }, true)

				dna_card:add_to_deck()
				G.jokers:emplace(dna_card)
				dna_card:start_materialize()
				return true
			end,
		}))
	end
}