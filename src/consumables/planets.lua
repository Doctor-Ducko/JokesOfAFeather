SMODS.Consumable {
    key = "phobetor",
    set = "Planet",
    cost = 3,
    atlas = "JOAFPlanets",
    pos = { x = 3, y = 0 },
    loc_txt = {
        name = "Phobetor",
        text = {
            "{S:0.8}({S:0.8,V:1}lvl.#1#{S:0.8}){} Level up",
            "{C:attention}#2#",
            "{C:mult}+#3#{} Mult and",
            "{C:chips}+#4#{} chips",
        },
    },
    config = { hand_type = 'Three Pair' },
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                G.GAME.hands["joaf_"..card.ability.hand_type].level,
                localize("joaf_"..card.ability.hand_type, 'poker_hands'),
                G.GAME.hands["joaf_"..card.ability.hand_type].l_mult,
                G.GAME.hands["joaf_"..card.ability.hand_type].l_chips,
                colours = { (G.GAME.hands["joaf_"..card.ability.hand_type].level == 1 and G.C.UI.TEXT_DARK or G.C.HAND_LEVELS[math.min(7, G.GAME.hands["joaf_"..card.ability.hand_type].level)]) }
            }
        }
    end,
    in_pool = function(self, args)
        return JOAF.get_poker_hand_stat("joaf_" .. self.config.hand_type, "visible")
    end,
    set_card_type_badge = function(self, card, badges)
        badges[#badges+1] = create_badge("Exoplanet", G.C.SECONDARY_SET.Planet, G.C.WHITE, 1.2 )
    end
    
}

SMODS.Consumable {
    key = "draugr",
    set = "Planet",
    cost = 3,
    atlas = "JOAFPlanets",
    pos = { x = 2, y = 0 },
    loc_txt = {
        name = "Draugr",
        text = {
            "{S:0.8}({S:0.8,V:1}lvl.#1#{S:0.8}){} Level up",
            "{C:attention}#2#",
            "{C:mult}+#3#{} Mult and",
            "{C:chips}+#4#{} chips",
        },
    },
    config = { hand_type = 'Double Threes' },
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                G.GAME.hands["joaf_"..card.ability.hand_type].level,
                localize("joaf_"..card.ability.hand_type, 'poker_hands'),
                G.GAME.hands["joaf_"..card.ability.hand_type].l_mult,
                G.GAME.hands["joaf_"..card.ability.hand_type].l_chips,
                colours = { (G.GAME.hands["joaf_"..card.ability.hand_type].level == 1 and G.C.UI.TEXT_DARK or G.C.HAND_LEVELS[math.min(7, G.GAME.hands["joaf_"..card.ability.hand_type].level)]) }
            }
        }
    end,
    in_pool = function(self, args)
        return JOAF.get_poker_hand_stat("joaf_" .. self.config.hand_type, "visible")
    end,
    set_card_type_badge = function(self, card, badges)
        badges[#badges+1] = create_badge("Exoplanet", G.C.SECONDARY_SET.Planet, G.C.WHITE, 1.2 )
    end
}

SMODS.Consumable {
    key = "saffar",
    set = "Planet",
    cost = 3,
    atlas = "JOAFPlanets",
    pos = { x = 0, y = 0 },
    loc_txt = {
        name = "Saffar",
        text = {
            "{S:0.8}({S:0.8,V:1}lvl.#1#{S:0.8}){} Level up",
            "{C:attention}#2#",
            "{C:mult}+#3#{} Mult and",
            "{C:chips}+#4#{} chips",
        },
    },
    config = { hand_type = 'Full Mansion' },
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                G.GAME.hands["joaf_"..card.ability.hand_type].level,
                localize("joaf_"..card.ability.hand_type, 'poker_hands'),
                G.GAME.hands["joaf_"..card.ability.hand_type].l_mult,
                G.GAME.hands["joaf_"..card.ability.hand_type].l_chips,
                colours = { (G.GAME.hands["joaf_"..card.ability.hand_type].level == 1 and G.C.UI.TEXT_DARK or G.C.HAND_LEVELS[math.min(7, G.GAME.hands["joaf_"..card.ability.hand_type].level)]) }
            }
        }
    end,
    in_pool = function(self, args)
        return JOAF.get_poker_hand_stat("joaf_" .. self.config.hand_type, "visible")
    end,
    set_card_type_badge = function(self, card, badges)
        badges[#badges+1] = create_badge("Exoplanet", G.C.SECONDARY_SET.Planet, G.C.WHITE, 1.2 )
    end
}

SMODS.Consumable {
    key = "majriti",
    set = "Planet",
    cost = 3,
    atlas = "JOAFPlanets",
    pos = { x = 1, y = 0 },
    loc_txt = {
        name = "Marjiti",
        text = {
            "{S:0.8}({S:0.8,V:1}lvl.#1#{S:0.8}){} Level up",
            "{C:attention}#2#",
            "{C:mult}+#3#{} Mult and",
            "{C:chips}+#4#{} chips",
        },
    },
    config = { hand_type = 'Flush Mansion' },
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                G.GAME.hands["joaf_"..card.ability.hand_type].level,
                localize("joaf_"..card.ability.hand_type, 'poker_hands'),
                G.GAME.hands["joaf_"..card.ability.hand_type].l_mult,
                G.GAME.hands["joaf_"..card.ability.hand_type].l_chips,
                colours = { (G.GAME.hands["joaf_"..card.ability.hand_type].level == 1 and G.C.UI.TEXT_DARK or G.C.HAND_LEVELS[math.min(7, G.GAME.hands["joaf_"..card.ability.hand_type].level)]) }
            }
        }
    end,
    in_pool = function(self, args)
        return JOAF.get_poker_hand_stat("joaf_" .. self.config.hand_type, "visible")
    end,
    set_card_type_badge = function(self, card, badges)
        badges[#badges+1] = create_badge("Exoplanet", G.C.SECONDARY_SET.Planet, G.C.WHITE, 1.2 )
    end
}