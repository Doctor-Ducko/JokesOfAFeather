SMODS.Consumable {
    key = "golden_ring",       -- Object ID, acessed with c_joaf_[key]
    atlas = "JOAFItems",        -- Spritesheet to use, initalized in main script
    pos = {x=4, y=1},           -- works on a +1 increment per sprite, not based off of pixels
    set = "Trinkets",           -- Which consumable group to put it in | "Tarot" "Planet" "Spectral" are vanilla, modded sets do not use mod prefix
    cost = 4,                   -- shop price

	unlocked = true,			
	discovered = false,

    loc_txt = {
        name = 'Golden Ring',
        text = {
            "Adds a {C:money}+$#1#{} bonus to",
            "{C:attention}#2#{} selected cards",
            "{C:inactive}(Can be stacked){}"
        }
    },

	config = {
        perma_money = 2,
        max_highlighted = 2,
    },

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                self.config.perma_money,
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
                G.hand.highlighted[i].ability.perma_p_dollars = G.hand.highlighted[i].ability.perma_p_dollars + card.ability.perma_money
                G.hand.highlighted[i]:juice_up(0.3,0.5)
                return true end }))
            
            delay(0.5)
        end
        G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.2,func = function() G.hand:unhighlight_all(); return true end }))
    end
}