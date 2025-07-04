SMODS.Consumable {
    key = "balance",          -- Object ID, acessed with c_joaf_[key]
    atlas = "JOAFItems",        -- Spritesheet to use, initalized in main script
    pos = {x=0, y=0},           -- works on a +1 increment per sprite, not based off of pixels
    set = "Tarot",           -- Which consumable group to put it in | "Tarot" "Planet" "Spectral" are vanilla, modded sets do not use mod prefix
    cost = 3,                   -- shop price

	unlocked = true,			
	discovered = false,

    loc_txt = {
        name = 'The Balance',
        text = {
            "Enhances {C:attention}#1#{} selected",
            "cards into",
            "{C:attention}Combo Cards",
        }
    },

    -- Yknow i have no idea if this is a good idea
    -- but like it works
    effect = "Enhance",
    config = {
        mod_conv = 'm_joaf_combo',
        max_highlighted = 2
    },

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.max_highlighted,
            }
        }
    end,

    -- Determines where the consumable can be used, default for Trinket cards
	can_use = function(self, card)
		if G.hand and (#G.hand.highlighted >= 1) and (#G.hand.highlighted <= card.ability.max_highlighted) then
			return true
		end
		return false
	end,
}