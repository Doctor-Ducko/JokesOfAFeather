SMODS.Consumable {
    key = "stargazing_guide",          -- Object ID, acessed with c_joaf_[key]
    atlas = "JOAFItems",        -- Spritesheet to use, initalized in main script
    pos = {x=10, y=0},           -- works on a +1 increment per sprite, not based off of pixels
    set = "Trinkets",           -- Which consumable group to put it in | "Tarot" "Planet" "Spectral" are vanilla, modded sets do not use mod prefix
    cost = 4,                   -- shop price

	unlocked = true,			
	discovered = false,

    loc_txt = {
        name = 'Stargazing Guide',
        text = {
            "Create a random {C:planet}Planet{} card"
        }
    },

    -- Determines where the consumable can be used, default for Trinket cards
    can_use = function(self, card)
        return G.consumeables and #G.consumeables.cards < G.consumeables.config.card_limit + 1
    end,

    use = function(self, card, area)
        G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.1, func = function()
            SMODS.add_card({ set = 'Planet' })
        return true end }))
    end
}