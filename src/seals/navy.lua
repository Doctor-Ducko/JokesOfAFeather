SMODS.Seal {
    key = "navy",
    badge_colour = HEX("3849cf"),
	config = {set = "Spectral"},
    loc_txt = {
        label = 'Navy Seal',
        name = 'Navy Seal',
        text = {
            "Create a {C:spectral}#1# Card{}",
            "when {C:attention}discarded",
            "{C:inactive}(Must have room)"
        }
    },
    loc_vars = function(self, info_queue)
        return { vars = {self.config.set, } }
    end,
    atlas = "JOAFEnhance",
    pos = {x=3, y=0},

    calculate = function(self, card, context)
        if context.discard and context.other_card == card and #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
            G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
            G.E_MANAGER:add_event(Event({
                func = (function()
                    SMODS.add_card {
                        set = 'Spectral',
                        key_append = 'joaf_navy' -- Optional, useful for checking the source of the creation in `in_pool`.
                    }
                    G.GAME.consumeable_buffer = 0
                    return true
                    end)
                }))
            return {
                message = "+1 Spectral",
                colour = G.C.SPECTRAL
            }
        end
    end,
}