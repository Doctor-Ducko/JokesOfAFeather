SMODS.Consumable {
    key = "booster_pak",          -- Object ID, acessed with c_joaf_[key]
    atlas = "JOAFItems",        -- Spritesheet to use, initalized in main script
    pos = {x=7, y=0},           -- works on a +1 increment per sprite, not based off of pixels
    set = "Trinkets",           -- Which consumable group to put it in | "Tarot" "Planet" "Spectral" are vanilla, modded sets do not use mod prefix
    cost = 4,                   -- shop price

	unlocked = true,			
	discovered = false,

    loc_txt = {
        name = 'Booster Pak',
        text = {
            "Draw {C:attention}#1#{} cards",
            "during a blind"
        }
    },

	config = {
        draw_count = 5,
    },

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                self.config.draw_count
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
            G.FUNCS.draw_from_deck_to_hand(self.config.draw_count)
        return true end }))
    end
}