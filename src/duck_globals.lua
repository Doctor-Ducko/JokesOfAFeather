JOAF.P_FACE_CARDS = {
    G.P_CARDS.H_J,  -- Jack of Hearts
    G.P_CARDS.H_Q,  -- Queen of Hearts
    G.P_CARDS.H_K,  -- King of Hearts
    G.P_CARDS.C_J,  -- Jack of Clubs
    G.P_CARDS.C_Q,  -- Queen of Clubs
    G.P_CARDS.C_K,  -- King of Clubs
    G.P_CARDS.D_J,  -- Jack of Diamonds
    G.P_CARDS.D_Q,  -- Queen of Diamonds
    G.P_CARDS.D_K,  -- King of Diamonds
    G.P_CARDS.S_J,  -- Jack of Spades
    G.P_CARDS.S_Q,  -- Queen of Spades
    G.P_CARDS.S_K,  -- King of Spades
}

JOAF.P_NUMBER_CARDS = {
    -- Hearts
    G.P_CARDS.H_2,
    G.P_CARDS.H_3,
    G.P_CARDS.H_4,
    G.P_CARDS.H_5,
    G.P_CARDS.H_6,
    G.P_CARDS.H_7,
    G.P_CARDS.H_8,
    G.P_CARDS.H_9,
    G.P_CARDS.H_T,
    G.P_CARDS.H_A,
    -- Clubs
    G.P_CARDS.C_2,
    G.P_CARDS.C_3,
    G.P_CARDS.C_4,
    G.P_CARDS.C_5,
    G.P_CARDS.C_6,
    G.P_CARDS.C_7,
    G.P_CARDS.C_8,
    G.P_CARDS.C_9,
    G.P_CARDS.C_T,
    G.P_CARDS.C_A,
    -- Diamonds
    G.P_CARDS.D_2,
    G.P_CARDS.D_3,
    G.P_CARDS.D_4,
    G.P_CARDS.D_5,
    G.P_CARDS.D_6,
    G.P_CARDS.D_7,
    G.P_CARDS.D_8,
    G.P_CARDS.D_9,
    G.P_CARDS.D_T,
    G.P_CARDS.D_A,
    -- Spades
    G.P_CARDS.S_2,
    G.P_CARDS.S_3,
    G.P_CARDS.S_4,
    G.P_CARDS.S_5,
    G.P_CARDS.S_6,
    G.P_CARDS.S_7,
    G.P_CARDS.S_8,
    G.P_CARDS.S_9,
    G.P_CARDS.S_T,
    G.P_CARDS.S_A,
}

JOAF.joaf_legendaries = {
    "emperor",
    "flug",
    "money_smart"
}

--[[IN TEXT COLORS ARE IN THE "misc_functions.toml" file]]
-- New Colors
G.C.PINK                = HEX("EB6ABD")
G.C.NAVY                = HEX("3849CF")
G.C.DARK_GREEN          = HEX("21AA11")

JOAF.reference_table = {
                    --Name,             Color,        Text Color
    earthbound      = {"EarthBound",    HEX('6b4eed'), G.C.WHITE},
    toby_fox        = {"Toby Fox",      G.C.WHITE,     HEX("000000")},
    deltarune       = {"deltarune",     HEX("11c1f7"), G.C.WHITE},
    tf2             = {"TF2",           HEX("d8762b"), G.C.WHITE},
    ror2            = {"Risk of Rain 2",HEX("0c5e49"), G.C.WHITE},
}

JOAF.dev_table = {
                    --Name,             Color,        Text Color
    doctor_ducko    = {"Doctor Ducko",  HEX('F5A742'), G.C.WHITE},
    chilli          = {"Chilli",        HEX('E02D2D'), G.C.WHITE},
    altf4           = {"AltF4",         HEX('0DBD1C'), G.C.WHITE},
    alpine488       = {"Alpine488",     HEX('923EE6'), G.C.WHITE},
    kawabae         = {"Kawabae",       HEX('fc83fa'), G.C.WHITE},
}

--[[
These add badges to cards that have refrences
or need credits to the people that made them

theres also the unused exprimental badge im not getting rid of it
]]
JOAF.credit_badge = function(card, badges, key)
    local data = JOAF.dev_table[key]
    badges[#badges+1] = create_badge("Idea: "..data[1], data[2],data[3], 0.9)
end

JOAF.reference_badge = function(card, badges, key)
    local data = JOAF.reference_table[key]
    badges[#badges+1] = create_badge("Refrence: "..data[1], data[2],data[3], 0.9)
end

JOAF.experimental_badge = function(badges)
    badges[#badges+1] = create_badge("!EXPERIMENTAL!", G.C.RED, G.C.WHITE, 1)
    badges[#badges+1] = create_badge("!May behave unexpectedly!", G.C.RED, G.C.WHITE, 1)
end

-- Factorial function -> !
JOAF.factorial = function(n)
    if n < 0 then
        return 0
    elseif n == 0 or n == 1 then
        return 1
    else
        return n * JOAF.factorial(n-1)
    end
end

-- Removes the first value matching the requested value from a table
-- i fucking hate the shit outta lua
JOAF.remove_from_table = function(table, value)
    local new_table = {}
    for i, v in ipairs(table) do
        if not v == value then
            new_table[#new_table+1] = v
        end
    end
    return new_table
end

-- Returns the number of Jokers owned that have the requested rarity
JOAF.count_jokers_of_rarity = function(rarity)
    local x = 0
    for i = 1, #G.jokers.cards do
        if G.jokers.cards[i].ability.set == 'Joker' and G.jokers.cards[i].config.center.rarity == rarity then
            x = x + 1
        end
    end
    return x
end

JOAF.is_showdown_blind = function(key)
    local blind = G.P_BLINDS[key] or {}
    if blind.boss then
        if blind.boss.showdown then
            return true
        else
            return false
        end
    else
        return false
    end
end

-- Returns the value of a certain poker hand stat, to be expanded later
JOAF.get_poker_hand_stat = function(hand, stat)
    if hand ~= nil then
        stat = string.lower(stat)
    else
        stat = "chips"
    end
    hand = hand or "High Card"
    local hand_stats = G.GAME.hands[hand]
    if stat == "chips" then
        return to_number(hand_stats.chips)
    elseif stat == "mult" then
        return to_number(hand_stats.mult)
    elseif stat == "level" then
        return to_number(hand_stats.level)
    elseif stat == "visible" then
        return hand_stats.visible
    else
        return -1
    end
end

-- TO DO: rewrite this
JOAF.get_chip_value = function(id, enhancement)
    local chip_value = id

    if id >= 11 and id <= 13 then
        chip_value = 10
    elseif id == 14 then
        chip_value = 11
    end

    if enhancement == "Stone Card" then
        chip_value = 50
    end

    return chip_value
end

-- Returns a table of all visible poker hands
JOAF.get_valid_poker_hands = function(current_hand)
    local valid_hands = {}
    for hand, stats in pairs(G.GAME.hands) do
        if stats.visible and hand ~= current_hand then
            valid_hands[#valid_hands+1] = hand
        end
    end

    return valid_hands
end

-- counts the amount of cards in your deck with the specified enhancement
JOAF.count_cards_of_enhancement = function(key)
    local count = 0
    if G.playing_cards then
        for i, card in ipairs(G.playing_cards) do
            if SMODS.has_enhancement(card, key) then
                count = count + 1
            end
        end
    end
    return count
end

-- Sets blind requirement to the inputted percent of current chips
JOAF.change_blind_requirement = function(percent_of)
	G.GAME.blind.chips = G.GAME.blind.chips * (percent_of / 100)
	G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
end

-- Changes the sprite of a card, cannot change atlas
JOAF.change_sprite = function(card, x, y)
	G.E_MANAGER:add_event(Event({
		func = function()
			card:flip()
        	G.E_MANAGER:add_event(Event({
                trigger = "after", 
                delay = 1,
                func = function()
                    card.config.center.pos.x = x
                    card.config.center.pos.y = y
                    card:flip()
                    return true
                end
            }))
			return true
		end
	}))
end

-- Generates the UNO card description, dont wanna put it into the joker file
-- DOESNT EVEN FUCKING WORK
JOAF.generate_uno_description = function(data)
    local description = "None"
    data.rank    = data.rank or -1
    data.ability = data.ability or "none"
    if data.rank == 14 then -- Convert Id to name
        data.rank = "Ace"
    end
    -- fml
    if data.ability == "x_mult" then
        description = data.rank .. "s of" .. data.suit .. "score {X:mult,C:white}X" .. data.value .. "{} Mult"
    elseif data.ability == "mult" then
        description = data.rank .. "s of" .. data.suit .. "score {C:mult}+" .. data.value .. "{} Mult"
    elseif data.ability == "chips" then
        description = data.rank .. "s of" .. data.suit .. "score {C:chips}+" .. data.value .. "{} chips"
    elseif data.ability == "dollars" then
        description = data.rank .. "s of" .. data.suit .. "score {C:money}$" .. data.value
    elseif data.ability == "suit_change" then
        description = "All non-" .. data.suit .. " played are converted to " .. data.suit .. " when scored"
    elseif data.ability == "blind_req" then
        description = data.suit .. " lower {C:attention}Blind Requirement{} by {C:attention}" .. data.value .. "%{} when scored"
    elseif data.ability == "retrigger" then
        description = "All played " .. data.suit .. " are retriggered {C:attention}" .. data.value .. "{} times(s)"
    end
    return description
end

-- Copy & Paste of the plasma balance effect used in the Plasma Deck
JOAF.plasma_balance = function()
    local tot = hand_chips + mult

			hand_chips = math.floor(tot/2)
			mult = math.floor(tot/2)

			update_hand_text({delay = 0}, {mult = mult, chips = hand_chips})

			G.E_MANAGER:add_event(Event({
				func = (function()
					local text = localize('k_balanced')
					play_sound('gong', 0.94, 0.3)
					play_sound('gong', 0.94*1.5, 0.2)
					play_sound('tarot1', 1.5)
					ease_colour(G.C.UI_CHIPS, {0.8, 0.45, 0.85, 1})
					ease_colour(G.C.UI_MULT, {0.8, 0.45, 0.85, 1})
					attention_text({
						scale = 1.4, text = text, hold = 2, align = 'cm', offset = {x = 0,y = -2.7},major = G.play
					})
					G.E_MANAGER:add_event(Event({
						trigger = 'after',
						blockable = false,
						blocking = false,
						delay =  4.3,
						func = (function() 
								ease_colour(G.C.UI_CHIPS, G.C.BLUE, 2)
								ease_colour(G.C.UI_MULT, G.C.RED, 2)
							return true
						end)
					}))
					G.E_MANAGER:add_event(Event({
						trigger = 'after',
						blockable = false,
						blocking = false,
						no_delete = true,
						delay =  6.3,
						func = (function() 
							G.C.UI_CHIPS[1], G.C.UI_CHIPS[2], G.C.UI_CHIPS[3], G.C.UI_CHIPS[4] = G.C.BLUE[1], G.C.BLUE[2], G.C.BLUE[3], G.C.BLUE[4]
							G.C.UI_MULT[1], G.C.UI_MULT[2], G.C.UI_MULT[3], G.C.UI_MULT[4] = G.C.RED[1], G.C.RED[2], G.C.RED[3], G.C.RED[4]
							return true
						end)
					}))
					return true
				end)
			}))

			delay(0.6)
end