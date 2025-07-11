SMODS.Consumable {
    key = "explosion",          -- Object ID, acessed with c_joaf_[key]
    atlas = "JOAFItems",        -- Spritesheet to use, initalized in main script
    pos = {x=7, y=1},           -- works on a +1 increment per sprite, not based off of pixels
    set = "Tarot",           -- Which consumable group to put it in | "Tarot" "Planet" "Spectral" are vanilla, modded sets do not use mod prefix
    cost = 3,                   -- shop price

	unlocked = true,			
	discovered = false,

    loc_txt = {
        name = 'The Explosion',
        text = {
            "Enhances {C:attention}#1#{} selected",
            "cards into",
            "{C:attention}Dynamite Cards",
        }
    },

    -- Yknow i have no idea if this is a good idea
    -- but like it works
    effect = "Enhance",
    config = {
        mod_conv = 'm_joaf_dynamite',
        max_highlighted = 2
    },

    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS[card.ability.mod_conv]
        return {
            vars = {
                card.ability.max_highlighted,
            }
        }
    end,
}