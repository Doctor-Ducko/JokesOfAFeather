SMODS.Joker {
    key = "jokerkind",			-- Object ID, acessed with j_joaf_[key]
    atlas = "JOAFJokers",		-- Spritesheet to use, initalized in main script
    pos = {x = 9, y = 4},		-- works on a +1 increment, not based off of pixels
    rarity = 3,					-- 1-Common | 2-Uncommon | 3-Rare | 4-Legendary, string id for modded rarities, found in main script
    cost = 1,					-- shop price
    pools = {
        ["JOAFJokers"] = true
    },
    blueprint_compat = true,	-- Cosmetic only, define in calculate function
    eternal_compat = true,		-- Self Explanatory
    perishable_compat = true,

    unlocked = true,			-- Do not change these, they make the jokers visible on mod download
    discovered = false,

    -- Display text
    loc_txt = {
        name = "Jokerkind",
        text = {
            "{X:mult,C:white}X#1#{} Mult per filled",
            "Joker slot",
        }
    },

    -- Variables used in loc_vars and calculate
    config = {
        extra = {
            x_mult = 1
        }
    },

    set_badges = function(self, card, badges)
        JOAF.reference_badge(card, badges, "homestuck")
    end,

    -- Variables to be used in the loc_txt area
    loc_vars = function(self, info_queue, card)
    return {
        vars = {
            card.ability.extra.x_mult
        }
    }
    end,

    -- look at wiki for info i aint writing it down here
    calculate = function(self, card, context)
    if context.joker_main then
        return {
            x_mult = card.ability.extra.x_mult * #G.jokers.cards
        }
        end
    end
}
