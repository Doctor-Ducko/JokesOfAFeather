SMODS.Consumable {
    key = "eviction_notice",          -- Object ID, acessed with c_joaf_[key]
    atlas = "JOAFTrinkets",        -- Spritesheet to use, initalized in main script
    pos = {x=0, y=3},           -- works on a +1 increment per sprite, not based off of pixels
    set = "Trinkets",           -- Which consumable group to put it in | "Tarot" "Planet" "Spectral" are vanilla, modded sets do not use mod prefix
    cost = 4,                   -- shop price

	unlocked = true,			
	discovered = false,

    loc_txt = {
        name = 'Eviction Notice',
        text = {
            "Use to {C:attention}Disable{} the",
            "current {C:attention}Boss Blind"
        }
    },

    can_use = function(self, card)
        return G.GAME.blind ~= nil and G.GAME.blind.blind_set and G.GAME.blind.boss
    end,

    use = function(self, card, area)
        G.GAME.blind:disable()
    end
}