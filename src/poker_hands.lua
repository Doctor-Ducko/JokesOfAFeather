SMODS.PokerHand {
    key = "Three Pair",
    chips = 50,
    mult = 5,
    l_mult = 3,
    l_chips = 25,
    visible = false,
    loc_txt = {
        name = "Three Pair",
        description = {
            "3 pairs of cards with different ranks"
        }
    },
    example = {
        { 'S_A', true },
        { 'D_A', true },
        { 'H_9', true },
        { 'C_9', true },
        { 'D_3', true },
        { 'H_3', true },
    },
    evaluate = function(parts, hand)
        if #parts._2 < 3 then return {} end
        return parts._all_pairs
    end
}

SMODS.PokerHand {
    key = "Double Threes",
    chips = 100,
    mult = 10,
    l_mult = 4,
    l_chips = 50,
    visible = false,
    loc_txt = {
        name = "Double Threes",
        description = {
            "2 sets of 3 cards with the same rank"
        }
    },
    example = {
        { 'D_5', true },
        { 'S_5', true },
        { 'C_5', true },
        { 'H_2', true },
        { 'C_2', true },
        { 'S_2', true },
    },
    evaluate = function(parts, hand)
        if #parts._3 < 2 then return {} end
        return parts._all_pairs
    end
}

SMODS.PokerHand {
    key = "Full Mansion",
    chips = 200,
    mult = 20,
    l_mult = 6,
    l_chips = 60,
    visible = false,
    loc_txt = {
        name = "Full Mansion",
        description = {
            "A Four of a Kind and a Three of a Kind"
        }
    },
    example = {
        { 'D_9', true },
        { 'S_9', true },
        { 'C_9', true },
        { 'H_9', true },
        { 'C_J', true },
        { 'H_J', true },
        { 'S_J', true },
    },
    evaluate = function(parts, hand)
        if #parts._4 < 1 or #parts._3 < 2 then return {} end
        return parts._all_pairs
    end
}

SMODS.PokerHand {
    key = "Flush Mansion",
    chips = 250,
    mult = 25,
    l_mult = 7,
    l_chips = 70,
    visible = false,
    loc_txt = {
        name = "Flush Mansion",
        description = {
            "A Four of a Kind and a Three of a Kind",
            "of the same suit"
        }
    },
    example = {
        { 'H_6', true },
        { 'H_6', true },
        { 'H_6', true },
        { 'H_6', true },
        { 'H_4', true },
        { 'H_4', true },
        { 'H_4', true },
    },
    evaluate = function(parts, hand)
        if #parts._4 < 1 or #parts._3 < 2 or not next(parts._flush) then return {} end
        return { SMODS.merge_lists(parts._all_pairs, parts._flush) }
    end
}