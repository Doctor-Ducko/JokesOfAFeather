SMODS.Seal {
    key = "orange",
    badge_colour = HEX("fa9338"),
	config = {set = "Trinket"},
    loc_txt = {
        label = 'Orange Seal',
        -- Tooltip description
        name = 'Orange Seal',
        text = {
            "Create a {C:attention}#1# Card{}",
            "when {C:attention}scored",
            "{C:inactive}(Must have room)"
        }
    },
    loc_vars = function(self, info_queue)
        return { vars = {self.config.set, } }
    end,
    atlas = "JOAFEnhance",
    pos = {x=4, y=0},

    calculate = function(self, card, context)
        if context.cardarea == G.play and context.main_scoring and #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
            G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
            G.E_MANAGER:add_event(Event({
                func = (function()
                    SMODS.add_card {
                        set = 'Trinkets',
                        key_append = 'joaf_orange' -- Optional, useful for checking the source of the creation in `in_pool`.
                    }
                    G.GAME.consumeable_buffer = 0
                    return true
                    end)
                }))
            return {
                message = "+1 Trinket",
                colour = G.C.FILTER
            }
        end
    end,
}