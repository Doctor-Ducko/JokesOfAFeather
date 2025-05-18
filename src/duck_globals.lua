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

-- Dev Colors
G.C.DOCTOR_DUCKO    = HEX('F5A742')
G.C.CHILLI          = HEX('E02D2D')
G.C.HYDROP0X        = HEX('0DBD1C')
G.C.ALPINE488       = HEX('923EE6')
G.C.PINK_MAGGIT     = HEX('EB85FF')

-- Other Colors
G.C.PINK        = HEX("EB6ABD")
G.C.NAVY        = HEX("3849CF")
G.C.DARK_GREEN  = HEX("21AA11")

--[[IN TEXT COLORS ARE IN THE "misc_functions.toml" file]]

JOAF.credit_badge = function(card, badges, name, color)
    badges[#badges+1] = create_badge("Idea: "..name, color, G.C.WHITE, 0.8)
end

JOAF.experimental_badge = function(card, badges)
    badges[#badges+1] = create_badge("EXPERIMENTAL", G.C.RED, G.C.WHITE, 0.8)
end

JOAF.count_jokers_of_rarity = function(rarity)
    local x = 0
    for i = 1, #G.jokers.cards do
        if G.jokers.cards[i].ability.set == 'Joker' and G.jokers.cards[i].config.center.rarity == rarity then
            x = x + 1
        end
    end
    return x
end

JOAF.get_poker_hand_stat = function(hand, stat)
    stat = string.lower(stat) or "chips"
    local hand_stats = G.GAME.hands[hand]
    if stat == "chips" then
        return hand_stats.chips
    elseif stat == "mult" then
        return hand_stats.mult
    elseif stat == "level" then
        return hand_stats.level
    elseif stat == "visible" then
        return hand_stats.visible
    else
        return -1
    end
end

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

JOAF.get_valid_poker_hands = function(current_hand)
    local valid_hands = {}
    for hand, stats in pairs(G.GAME.hands) do
        if stats.visible and hand ~= current_hand then
            valid_hands[#valid_hands+1] = hand
        end
    end

    return valid_hands
end