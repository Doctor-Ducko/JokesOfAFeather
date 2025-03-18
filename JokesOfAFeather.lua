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
SMODS.Atlas {
    key = "JOAFItems",
    path = "DuckItems.png",
	px = 71,
	py = 95
}


--[[RARITIES SECTION]]
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


--[[JOKERS SECTION]]
SMODS.Joker {
	key = 'joker?',
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
		if context.individual and context.cardarea == G.play then
			return {
				chips = card.ability.extra.chips,
				card = context.other_card
			}
		end
	end
}

SMODS.Joker {
	key = 'binary_joker',
	atlas = 'JOAFJokers',
	pos = { x = 3, y = 0 }, -- works on a +1 increment, not based off of pixels
	rarity = 1, -- 1: common, 2: uncommon, 3: rare, 4: legendary
	cost = 5,
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
	key = 'sunflower_joker',
	atlas = 'JOAFJokers',
	pos = { x = 5, y = 1 }, -- works on a +1 increment, not based off of pixels
	rarity = 1, -- 1: common, 2: uncommon, 3: rare, 4: legendary
	cost = 5,
	blueprint_compat = false,

	loc_txt = {
		name = 'Sunflower Joker',
		text={
			"Earn {C:money}$#1#{} when",
			"the round ends",
			"Increases by {C:attention}#2#{} when",
			"the round ends",
			"Maxes out at {C:money}$#3#{}"
		},
	},

	config = {
		extra = {
			money = 1,
			money_increase = 1,
			money_limit = 5
		}
	},

	loc_vars = function(self, info_queue, card)
		return {
			vars = {
				card.ability.extra.money,
				card.ability.extra.money_increase,
				card.ability.extra.money_limit,
			}
		}
	end,

	calc_dollar_bonus = function(self, card)
		local bonus = card.ability.extra.money
		if bonus > 0 then return bonus end
	end,

	calculate = function(self, card, context)
		if context.end_of_round and context.cardarea == G.jokers and (card.ability.extra.money + card.ability.extra.money_increase <= card.ability.extra.money_limit) then
			card.ability.extra.money = card.ability.extra.money + card.ability.extra.money_increase
			return {
				message = 'Upgraded!',
				colour = G.C.MONEY,
				card = card
			}
		end
	end
}

SMODS.Joker {
	key = 'dr_pepper',
	atlas = 'JOAFJokers',
	pos = { x = 7, y = 0 }, -- works on a +1 increment, not based off of pixels
	rarity = 2, -- 1: common, 2: uncommon, 3: rare, 4: legendary
	cost = 7,
	blueprint_compat = true,

	loc_txt = {
		name = 'Dr. Pepper',
		text = {
			"{C:mult}+#1#{} Mult",
			"{C:mult}-#2#{} Mult per round"
		}
	},

	config = {
		extra = {
			mult = 20,
			mult_loss = 2
		}
	},

	loc_vars = function(self, info_queue, card)
		return {
			vars = {
				card.ability.extra.mult,
				card.ability.extra.mult_loss,
			}
		}
	end,

	calculate = function(self, card, context)
		if context.joker_main then
			return {
				mult = card.ability.extra.mult,
				card = card
			}
		end
		if context.end_of_round and context.cardarea == G.jokers then
			card.ability.extra.mult = card.ability.extra.mult - card.ability.extra.mult_loss
			local value = card.ability.extra.mult
			if value <= 0 then
				G.E_MANAGER:add_event(Event({
					func = function()
						play_sound('tarot1')
						card.T.r = -0.2
						card:juice_up(0.3, 0.4)
						card.states.drag.is = true
						card.children.center.pinch.x = true
						G.E_MANAGER:add_event(Event({
							trigger = 'after',
							delay = 0.3,
							blockable = false,
							func = function()
								G.jokers:remove_card(card)
								card:remove()
								card = nil
								return true;
							end
						}))
						return true
					end
				}))
				return {
					message = 'Drank!',
					card = card
				}
			else
				return {
					message = 'Sip.',
					card = card
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
	key = "photographer",
	atlas = 'JOAFJokers',
	pos = { x = 1, y = 1 },
	rarity = 3,
	cost = 7,
	blueprint_compat = true,

	loc_txt = {
		name = "Photographer",
		text = {
			"Gains bonus chips",
			"according to the base",
			"chip value of a scored card",
			"{C:inactive}(Currently {C:chips}+#1#{}{C:inactive} chips)"
		}
	},

	config = {
		extra = {
			chips = 0,
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
			}
		end
		if context.individual and context.cardarea == G.play then
			local bonus = context.other_card:get_id()

			-- someone please tell me there's a better way to do this, this sucks ass
			if bonus >= 11 and bonus <= 13 then
				bonus = 10
			elseif bonus == 14 then
				bonus = 11
			end

			if context.other_card.ability.effect == "Stone Card" then
				bonus = 50
			end

			card.ability.extra.chips = card.ability.extra.chips + bonus
			return {
				message = '+'..tostring(bonus),
				colour = G.C.CHIPS,
				card = card
			}
		end
	end

}

SMODS.Joker {
	key = 'peter_griffin',
	atlas = 'JOAFJokers',
	pos = { x = 9, y = 0 }, -- works on a +1 increment, not based off of pixels
	rarity = "joaf_family", -- 1: common, 2: uncommon, 3: rare, 4: legendary
	cost = 20,
	blueprint_compat = true,

	loc_txt = {
		name = 'Peter Griffin',
		text={
			"{X:mult,C:white}X#1#{} Mult",
			"{C:inactive,s:0.9}(It seems today)",
		},
	},

	config = {
		extra = {
			Xmult = 8,
		}
	},

	loc_vars = function(self, info_queue, card)
		return {
			vars = {
				card.ability.extra.Xmult,
				card.ability.extra.Xchips
			}
		}
	end,

	calculate = function(self, card, context)
		if context.joker_main then
			return {
				Xmult_mod = card.ability.extra.Xmult,
				message = localize { type = 'variable', key = 'a_xmult', vars = { card.ability.extra.Xmult } }
			}
		end
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
			"{C:inactive,s:0.9}(That all you see)",
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
			"Increases Mult by {C:mult}#2#",
			"when a card is discarded",
			"{C:inactive}(Currently {C:mult}+#1#{}{C:inactive} Mult)",
			"{C:inactive,s:0.9}(On which we used to rely)",
		}
	},

	config = {
		extra = {
			mult = 0,
			mult_increase = 1,
		}
	},

	loc_vars = function(self, info_queue, card)
		return {
			vars = {
				card.ability.extra.mult,
				card.ability.extra.mult_increase,
			}
		}
	end,

	calculate = function(self, card, context)
		if context.discard then
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
		x_chips = 1.5
	}
}

--[[SEALS SECTION]]
SMODS.Seal {
    name = "my-Seal",
    key = "pink_seal",
    badge_colour = HEX("eb6abd"),
	config = {x_mult = 2},
    loc_txt = {
        label = 'Pink Seal',
        -- Tooltip description
        name = 'Pink Seal',
        text = {
            '{X:mult,C:white}X#1#{} Mult when this',
			'card is scored'
        }
    },
    loc_vars = function(self, info_queue)
        return { vars = {self.config.x_mult, } }
    end,
    atlas = "JOAFEnhance",
    pos = {x=2, y=0},

    -- self - this seal prototype
    -- card - card this seal is applied to
    calculate = function(self, card, context)
        -- main_scoring context is used whenever the card is scored
        if context.main_scoring and context.cardarea == G.play then
            return {
                x_mult = self.config.x_mult
            }
        end
    end,
}

--[[CONSUMABLES SECTION]]
--[[SMODS.Consumable{
	key = "balance_tarot",
	set = "Tarot",
	config = {
        max_highlighted = 1,
        extra = 'joaf_pink_seal',
    },
	loc_txt = {
		name = "Balance",
		text = "does something i think",
	},
	atlas = "JOAFItems",
	pos = {x=0,y=0},
	cost = 4,
}]]

SMODS.Consumable {
    set = "Spectral",
    key = "multiply_spectral",
	config = {
        max_highlighted = 1,
        extra = 'joaf_pink_seal',
    },
    loc_vars = function(self, info_queue, card)
        -- Handle creating a tooltip with seal args.
        info_queue[#info_queue+1] = G.P_SEALS[(card.ability or self.config).extra]
        -- Description vars
        return {vars = {(card.ability or self.config).max_highlighted}}
    end,
    loc_txt = {
        name = 'Multiply',
        text = {
            "Select {C:attention}#1#{} card to",
            "apply {C:attention}Pink Seal{}"
        }
    },
    cost = 4,
    atlas = "JOAFItems",
    pos = {x=2, y=0},
    use = function(self, card, area, copier)
        for i = 1, math.min(#G.hand.highlighted, card.ability.max_highlighted) do
            G.E_MANAGER:add_event(Event({func = function()
                play_sound('tarot1')
                card:juice_up(0.3, 0.5)
                return true end }))
            
            G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.1,func = function()
                G.hand.highlighted[i]:set_seal(card.ability.extra, nil, true)
                return true end }))
            
            delay(0.5)
        end
        G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.2,func = function() G.hand:unhighlight_all(); return true end }))
    end
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
				-- someone please tell me if theres a better way to do this
				local peter = create_card("Joker", G.jokers, nil, nil, nil, nil, "j_joaf_peter_griffin", "deck")
				local lois = create_card("Joker", G.jokers, nil, nil, nil, nil, "j_joaf_lois_griffin", "deck")
				local chris = create_card("Joker", G.jokers, nil, nil, nil, nil, "j_joaf_chris_griffin", "deck")
				local meg = create_card("Joker", G.jokers, nil, nil, nil, nil, "j_joaf_meg_griffin", "deck")
				local stewie = create_card("Joker", G.jokers, nil, nil, nil, nil, "j_joaf_stewie_griffin", "deck")
				local brian = create_card("Joker", G.jokers, nil, nil, nil, nil, "j_joaf_brian_griffin", "deck")

				peter:set_eternal(true)
				lois:set_eternal(true)
				chris:set_eternal(true)
				meg:set_eternal(true)
				stewie:set_eternal(true)
				brian:set_eternal(true)

				peter:add_to_deck()
				lois:add_to_deck()
				chris:add_to_deck()
				meg:add_to_deck()
				stewie:add_to_deck()
				brian:add_to_deck()

				G.jokers:emplace(peter)
				G.jokers:emplace(lois)
				G.jokers:emplace(chris)
				G.jokers:emplace(meg)
				G.jokers:emplace(stewie)
				G.jokers:emplace(brian)
				
				peter:start_materialize()
				lois:start_materialize()
				chris:start_materialize()
				meg:start_materialize()
				stewie:start_materialize()
				brian:start_materialize()
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
                    G.playing_cards[i]:set_ability("m_joaf_chipped")
                end
                return true
            end
        }))
    end
}