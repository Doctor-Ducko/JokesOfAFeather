SMODS.Consumable {
    key = "math_book",          -- Object ID, acessed with c_joaf_[key]
    atlas = "JOAFItems",        -- Spritesheet to use, initalized in main script
    pos = {x=3, y=1},           -- works on a +1 increment per sprite, not based off of pixels
    set = "Trinkets",           -- Which consumable group to put it in | "Tarot" "Planet" "Spectral" are vanilla, modded sets do not use mod prefix
    cost = 4,                   -- shop price

	unlocked = true,			
	discovered = false,

    loc_txt = {
        name = 'Math Book',
        text = {
            "Adds {C:mult}+#1#{} bonus Mult to",
            "{C:attention}#2#{} selected cards",
            "{C:inactive}(Can be stacked){}"
        }
    },

	config = {
        perma_mult = 3,
        max_highlighted = 2,
    },

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                self.config.perma_mult,
                self.config.max_highlighted,
            }
        }
    end,

    can_use = function(self, card)
        if (#G.hand.highlighted > 0 and #G.hand.highlighted <= card.ability.max_highlighted) then
            return true
        else 
            return false
        end
    end,

    use = function(self, card, area, copier)
        for i = 1, math.min(#G.hand.highlighted, card.ability.max_highlighted) do
            G.E_MANAGER:add_event(Event({func = function()
                play_sound('tarot1')
                card:juice_up(0.3, 0.5)
                return true end }))
            
            G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.1,func = function()
                G.hand.highlighted[i].ability.perma_mult = G.hand.highlighted[i].ability.perma_mult + card.ability.perma_mult
                G.hand.highlighted[i]:juice_up(0.3,0.5)
                return true end }))
            
            delay(0.5)
        end
        G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.2,func = function() G.hand:unhighlight_all(); return true end }))
    end
}