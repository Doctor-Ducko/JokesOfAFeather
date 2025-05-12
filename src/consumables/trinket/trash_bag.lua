SMODS.Consumable {
    key = "trash_bag",          -- Object ID, acessed with c_joaf_[key]
    atlas = "JOAFItems",        -- Spritesheet to use, initalized in main script
    pos = {x=5, y=0},           -- works on a +1 increment per sprite, not based off of pixels
    set = "Trinkets",           -- Which consumable group to put it in | "Tarot" "Planet" "Spectral" are vanilla, modded sets do not use mod prefix
    cost = 5,                   -- shop price

	unlocked = true,			
	discovered = false,

    loc_txt = {
        name = 'Trash Bag',
        text = {
            "Gain {C:attention}+#1#{} discards",
            "during a blind"
        }
    },

	config = {
        discards = 2,
    },

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                self.config.discards
            }
        }
    end,

    -- Determines where the consumable can be used, default for Trinket cards
    can_use = function(self, card)
        if G.GAME.blind ~= nil and G.GAME.blind.blind_set  then
            return true
        else 
            return false
        end
    end,

    use = function(self, card, area)
        G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.1, func = function()
            ease_discard(card.ability.discards)
        return true end }))
    end
}