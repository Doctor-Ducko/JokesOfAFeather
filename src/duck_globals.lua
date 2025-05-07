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
G.C.DOCTOR_DUCKO = HEX('F5A742')
G.C.CHILLI = HEX('E02D2D')
G.C.HYDROP0X = HEX('0DBD1C')
G.C.ALPINE488 = HEX('923EE6')

JOAF.duckjoker_rarities = {
	-- Common
	["joker_qm"] 		= "Common",
	["jokerekoj"]		= "Common",
	["binary_joker"]	= "Common",
	["sunflower_joker"]	= "Common",
	["recycling_bin"]	= "Common",
	["simple_joker"]	= "Common",
	["picture_frame"]	= "Common",
	["misplaced"]		= "Common",
	["abundant_joker"]	= "Common",

	-- Uncommon
	["tinkerer_joker"]	= "Uncommon",
	["jokr"]			= "Uncommon",
	["lil_joker"]		= "Uncommon",
	["joker_face"]		= "Uncommon",
	["jimbo_jpg"]		= "Uncommon",
	["irritating_joker"]= "Uncommon",
	["dr_pepper"]		= "Uncommon",
	["straight_line"]	= "Uncommon",
	["slot_machine"]	= "Uncommon",
	["mia_joker"]		= "Uncommon",
	["novel_joker"]		= "Uncommon",

	-- Rare
	["comedian"]		= "Rare",
	["jramp"]			= "Rare",
	["57_leaf_clover"]	= "Rare",
	["joker_energy"]	= "Rare",
	["photographer"]	= "Rare",
	["evil_joker"]		= "Rare",
	["precious_joker"]	= "Rare",

	-- Legendary
	["emperor"] 		= "Legendary",
	["money_smart"] 	= "Legendary",
	["flug"] 			= "Legendary",
	
	-- Family
	["peter_griffin"]	= "Family",
	["lois_griffin"]	= "Family",
	["chris_griffin"]	= "Family",
	["meg_griffin"]		= "Family",
	["stewie_griffin"]	= "Family",
	["brian_griffin"]	= "Family",
}

-- Specifically for the object type thingy
JOAF.generate_duck_joker_dict = function(rarities)
    local rarities = rarities or {"Legendary", "Family"}
    local dict = {}
    -- Loops over every joker in the game
    for joker, joker_rarity in pairs(JOAF.duckjoker_rarities) do

        -- Checks if the joker's rarity is in the blacklist table
        local include = true
        for i,rarity in pairs(rarities) do
            if joker_rarity == rarity then
                include = not include
            end
        end

        if include then
            dict["j_joaf_" .. joker] = true
        end
    end
    return dict
end

-- These two functions are jank fuckin' city and i am praying to mother nature and big computer that this works :(

--[[JOAF.generate_duck_joker_rate = function(rarities) -- Yeah i have no fucking clue how ObjectType rarities work
    local rarities = rarities or {"Legendary", "Family"}
    local rate_table = {}
    -- Loops over every joker in the game
    for joker, joker_rarity in pairs(JOAF.load_jokers) do

        -- Checks if the joker's rarity is in the blacklist table
        local include = true
        for i,rarity in pairs(rarities) do
            if joker_rarity == rarity then
                include = not include
            end
        end

        if include then
            table.insert(rate_table, {key = "j_joaf_" .. joker})
        end
        --{key = "j_joaf_" .. joker, rate = JOAF.rarities_rate[joker_rarity]}
    end
    return rate_table
end]]

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