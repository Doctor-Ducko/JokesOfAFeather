P_FACE_CARDS = {
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

P_NUMBER_CARDS = {
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

function credit_badge(card, badges, name, color)
    badges[#badges+1] = create_badge("Idea: "..name, color, G.C.WHITE, 0.8)
end