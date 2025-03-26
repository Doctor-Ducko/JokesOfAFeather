SMODS.Consumable {
    key = "potato_chips",             -- Object ID, acessed with j_joaf_[key]
    atlas = "JOAFItems",        -- Spritesheet to use, initalized in main script
    pos = {x=7, y=0},           -- works on a +1 increment per sprite, not based off of pixels
    set = "Trinkets",           -- Which consumable group to put it in | "Tarot" "Planet" "Spectral" are vanilla, modded sets do not use mod prefix
    cost = 5,                   -- shop price

	unlocked = true,			-- Do not change these, they make the jokers visible on mod download
	discovered = true,

    loc_txt = {
        name = 'Potato Chips',
        text = {
            "Add {C:chips}+#1#{} chips",
            "to the current round score",
            "currently broken"
        }
    },

	config = {
        score_bonus = 1000,
    },

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                self.config.score_bonus
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
            ease_chips(card.ability.score_bonus)
        return true end }))
    end
}