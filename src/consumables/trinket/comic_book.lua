SMODS.Consumable {
    key = "comic_book",          -- Object ID, acessed with c_joaf_[key]
    atlas = "JOAFTrinkets",        -- Spritesheet to use, initalized in main script
    pos = {x=4, y=0},           -- works on a +1 increment per sprite, not based off of pixels
    set = "Trinkets",           -- Which consumable group to put it in | "Tarot" "Planet" "Spectral" are vanilla, modded sets do not use mod prefix
    cost = 4,                   -- shop price

	unlocked = true,			
	discovered = false,

    loc_txt = {
        name = 'Comic Book',
        text = {
            "Create a random",
            "{C:attention}Joker"
        }
    },

    -- Determines where the consumable can be used, default for Trinket cards
    can_use = function(self, card)
        return G.jokers and #G.jokers.cards < G.jokers.config.card_limit
    end,

    use = function(self, card, area)
        G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.1, func = function()
            SMODS.add_card({ set = 'Joker' })
        return true end }))
    end
}