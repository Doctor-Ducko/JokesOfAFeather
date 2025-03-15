--[[
WELCOME TO THE PETRIFYING SOURCE CODE OF THIS MOD !!
====================================================
Please make sure to have a canister of bleach to your
immediate left and/or right incase of visual interaction
with programming based war crimes.
]]

SMODS.Keybind {
	key = "Restart Game",
	key_pressed = "r",
	action = function(self)
		SMODS.restart_game()
	end,
	held_keys = {"lctrl"},
	event = "released"
}


--[[SPRITES/ATLAS SECTION]]
SMODS.Atlas {
    key = "JOAFJokers",
    path = "DuckJokers.png",
	px = 71,
	py = 95
}
SMODS.Atlas {
    key = "JOAFDecks",
    path = "DuckDecks.png",
	px = 71,
	py = 95
}
SMODS.Atlas {
    key = "JOAFEnhance",
    path = "DuckEnhancements.png",
	px = 71,
	py = 95
}


--[[
RARITIES SECTION

Currently Added:
	Family Guy
]]
SMODS.Rarity({
	key = "family",
	loc_txt = {
		name = "Family Guy"
	},
	badge_colour = HEX("3b9c14"),
	default_weight = 0.003,
	pools = {
		["Joker"] = true
	},
})


--[[
JOKERS SECTION

Currently Added:
	Binary Joker 	Common
	Meg Griffin		Legendary
	Straight Line	Uncommon
	Misplaced		Uncommon
]]
SMODS.Joker {
	key = 'binary_joker',
	atlas = 'JOAFJokers',
	pos = { x = 3, y = 0 }, -- works on a +1 increment, not based off of pixels
	rarity = 1, -- 1: common, 2: uncommon, 3: rare, 4: legendary
	cost = 4,
	blueprint_compat = true,

	loc_txt = {
		name = 'Binary Joker',
		text = {
			"Each played {C:attention}Ace{} or {C:attention}2",
			"gives {C:mult}+#1#{} Mult when scored"
		}
	},

	config = {
		extra = {
			mult = 10
		}
	},

	loc_vars = function(self, info_queue, card)
		return {
			vars = {
				card.ability.extra.mult
			}
		}
	end,

	calculate = function(self, card, context)
		if context.individual and context.cardarea == G.play then
			--Jack is 11, Queen is 12, King is 13, and Ace is 14.
			if context.other_card:get_id() == 14 or context.other_card:get_id() == 2 then
				return {
					mult = card.ability.extra.mult,
					card = context.other_card
				}
			end
		end
	end
}

SMODS.Joker {
	key = "straight_line",
	atlas = 'JOAFJokers',
	pos = { x = 2, y = 0 },
	rarity = 2,
	cost = 7,
	blueprint_compat = true,

	loc_txt = {
		name = "Straight Line",
		text = {
			"Gains {X:mult,C:white} X#2# {} Mult",
			"if played hand",
			"contains a {C:attention}Straight{}",
			"{C:inactive}(Currently {X:mult,C:white}X#1#{}{C:inactive} Mult)"
		}
	},

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
	atlas = 'JOAFJokers',
	pos = { x = 5, y = 0 }, -- works on a +1 increment, not based off of pixels
	rarity = 2, -- 1: common, 2: uncommon, 3: rare, 4: legendary
	cost = 7,

	loc_txt = {
		name = "Misplaced",
		text = {
			"Gain {C:blue}+#1#{} hand",
			"per round"
		}
	},

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

SMODS.Joker {
	key = 'lois_griffin',
	atlas = 'JOAFJokers',
	pos = { x = 10, y = 0 }, -- works on a +1 increment, not based off of pixels
	rarity = "joaf_family", -- 1: common, 2: uncommon, 3: rare, 4: legendary
	cost = 20,
	blueprint_compat = true,

	loc_txt = {
		name = 'Lois Griffin',
		text={
			"Earn {C:money}$#1#{} when",
			"the round ends",
		},
	},

	config = {
		extra = {
			money = 15
		}
	},

	loc_vars = function(self, info_queue, card)
		return {
			vars = {
				card.ability.extra.money
			}
		}
	end,

	calc_dollar_bonus = function(self, card)
		local bonus = card.ability.extra.money
		if bonus > 0 then return bonus end
	end
}

SMODS.Joker {
	key = 'chris_griffin',
	atlas = 'JOAFJokers',
	pos = { x = 8, y = 0 }, -- works on a +1 increment, not based off of pixels
	rarity = "joaf_family", -- 1: common, 2: uncommon, 3: rare, 4: legendary
	cost = 20,
	blueprint_compat = true,

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
			"{C:attention}+#1# Joker{} slots"
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
			"{C:chips}+#1#{} chips"
		}
	},

	config = {
		extra = {
			chips = 200,
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

--[[ENHANCEMENTS SECTION]]
SMODS.Enhancement{
    key = "combo",

	loc_txt = {
        name = "Combo Card",
        text ={
            "{C:chips}+20{} chips and",
            "{C:mult}+3{} Mult",
        },
	},

	atlas = 'JOAFEnhance',
	pos = {x = 0, y = 0},
	config = {
		bonus = 20,
        mult = 3
	}
}

SMODS.Enhancement{
    key = "chipped",

	loc_txt = {
        name = "Chipped Card",
        text ={
            "{X:chips,C:white}X1.5{} chips",
			"when scored"
        },
	},

	atlas = 'JOAFEnhance',
	pos = {x = 1, y = 0},
	config = {
		x_chips = 20
	}
}

--[[DECK SECTION]]
SMODS.Back{
    key = "family_deck",
	atlas = 'JOAFDecks',
    pos = {x = 0, y = 0},
    config = { joker_slot = 1 },
    loc_txt = {
        name = "Family Deck",
        text ={
            "Start with all",
			"{C:attention}Eternal Family Jokers{}",
			"and {C:attention}+1{} Joker Slot"
        },
    },
	apply = function(self, back)
		delay(0.4)
		G.E_MANAGER:add_event(Event({
			func = function()
				local lois = create_card("Joker", G.jokers, nil, nil, nil, nil, "j_joaf_lois_griffin", "deck")
				local chris = create_card("Joker", G.jokers, nil, nil, nil, nil, "j_joaf_chris_griffin", "deck")
				local meg = create_card("Joker", G.jokers, nil, nil, nil, nil, "j_joaf_meg_griffin", "deck")

				lois:set_eternal(true)
				chris:set_eternal(true)
				meg:set_eternal(true)

				lois:add_to_deck()
				chris:add_to_deck()
				meg:add_to_deck()

				G.jokers:emplace(lois)
				G.jokers:emplace(chris)
				G.jokers:emplace(meg)
				
				lois:start_materialize()
				chris:start_materialize()
				meg:start_materialize()
				return true
			end,
		}))
	end
}

SMODS.Back{
    key = "chipped_deck",
	atlas = 'JOAFDecks',
    pos = {x = 0, y = 0},
    config = {},
    loc_txt = {
        name = "Chipped Deck",
        text ={
            "all cards are chipped"
        },
    },
    apply = function()
        G.E_MANAGER:add_event(Event({
            func = function()
                for i = #G.playing_cards, 1, -1 do
                    G.playing_cards[i]:set_ability("chipped")
                end
                return true
            end
        }))
    end
}