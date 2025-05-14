SMODS.Seal {
    key = "lucky",
    badge_colour = HEX("21aa11"),
    atlas = "JOAFEnhance",
    pos = {x=8, y=0},

	config = {
        odds_mult = 5,
        mult = 20,
        odds_chips = 3,
        chips = 30,
        odds_retrigger = 15,
        retriggers = 2,
    },

    loc_txt = {
        label = 'Lucky Seal',
        -- Tooltip description
        name = 'Lucky Seal',
        text = {
            "{C:green}#1# in #2#{} for {C:mult}+#3#{} Mult",
            "{C:green}#1# in #4#{} for {C:chips}+#5#{} chips",
            "{C:green}#1# in #6#{} for {C:attention}#7#{} retriggers",
        }
    },

    loc_vars = function(self, info_queue)
        return {vars = {
            G.GAME.probabilities.normal,

            self.config.odds_mult,
            self.config.mult,

            self.config.odds_chips,
            self.config.chips,

            self.config.odds_retrigger,
            self.config.retriggers,
        }}
    end,

    calculate = function(self, card, context)
        if context.repetition and (pseudorandom('joaf_lucky_seal_retriggers') < G.GAME.probabilities.normal / card.ability.seal.odds_retrigger) then
            return {
                repetitions = card.ability.seal.retriggers,
            }
        end

        if context.cardarea == G.play and context.main_scoring then
        local returning = {chips = 0, mult = 0}
            if pseudorandom('joaf_lucky_seal_mult') < G.GAME.probabilities.normal / card.ability.seal.odds_mult then
                returning.mult = card.ability.seal.mult
            end
            if pseudorandom('joaf_lucky_seal_chips') < G.GAME.probabilities.normal / card.ability.seal.odds_chips then
                returning.chips = card.ability.seal.chips
            end
			return returning
        end
    end
}