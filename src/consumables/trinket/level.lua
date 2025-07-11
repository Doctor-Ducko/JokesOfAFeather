SMODS.Consumable {
    key = "level",          -- Object ID, acessed with c_joaf_[key]
    atlas = "JOAFTrinkets",        -- Spritesheet to use, initalized in main script
    pos = {x=0, y=2},           -- works on a +1 increment per sprite, not based off of pixels
    set = "Trinkets",           -- Which consumable group to put it in | "Tarot" "Planet" "Spectral" are vanilla, modded sets do not use mod prefix
    cost = 4,                   -- shop price

	unlocked = true,			
	discovered = false,

    loc_txt = {
        name = 'Level',
        text = {
            "Select up to {C:attention}#1#{} cards",
            "and {C:attention}average{} their ranks",
            "{C:inactive}(Jack=11, Queen=12, King=13, Ace=14)"
        }
    },

	config = {
        max_highlighted = 3,
    },

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                self.config.max_highlighted,
            }
        }
    end,

    use = function(self, card, area)
        local new_rank = 0
        local average = 0
        local div_by = #G.hand.highlighted

        for i, card in ipairs(G.hand.highlighted) do
            if not SMODS.has_no_rank(card) then
                average = average + card:get_id()
            else
                div_by = div_by - 1
            end
        end

        if div_by == 0 then
            return
        else
            new_rank = math.ceil(average/div_by)
        end

        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            func = function()
                play_sound('tarot1')
                card:juice_up(0.3, 0.5)
                return true
            end
        }))
        for i = 1, #G.hand.highlighted do
            local percent = 1.15 - (i - 0.999) / (#G.hand.highlighted - 0.998) * 0.3
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.15,
                func = function()
                    G.hand.highlighted[i]:flip()
                    play_sound('card1', percent)
                    G.hand.highlighted[i]:juice_up(0.3, 0.3)
                    return true
                end
            }))
        end
        delay(0.2)
        for i = 1, #G.hand.highlighted do
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.1,
                func = function()
                    if not SMODS.has_no_rank(G.hand.highlighted[i]) then
                        assert(SMODS.change_base(G.hand.highlighted[i], nil, JOAF.id_to_key(nil, new_rank)))
                    end
                    return true
                end
            }))
        end
        for i = 1, #G.hand.highlighted do
            local percent = 0.85 + (i - 0.999) / (#G.hand.highlighted - 0.998) * 0.3
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.15,
                func = function()
                    G.hand.highlighted[i]:flip()
                    play_sound('tarot2', percent, 0.6)
                    G.hand.highlighted[i]:juice_up(0.3, 0.3)
                    return true
                end
            }))
        end
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.2,
            func = function()
                G.hand:unhighlight_all()
                return true
            end
        }))
        delay(0.5)
    end,
}