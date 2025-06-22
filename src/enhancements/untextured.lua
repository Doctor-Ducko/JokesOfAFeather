SMODS.Enhancement{
    key = "untextured",

	loc_txt = {
        name = "Untextured Card",
        text ={
            "{C:chips}+#1#{} chips and {C:mult}+#2#{} Mult",
            "no rank or suit",
            "{C:green}#3# in #4#{} chance to",
            "{C:attention}lose{} enhancement"
        },
	},

	atlas = 'JOAFEnhance',
	pos = {x = 9, y = 0},

    replace_base_card = true,
    no_rank = true,
    no_suit = true,
    always_scores = true,

	config = {
		bonus = 25,
		mult = 10,
        odds = 10
	},
    loc_vars = function(self, info_queue, card)
        return { vars = {
            card.ability.bonus,
            card.ability.mult,
            G.GAME.probabilities.normal,
            card.ability.odds
        }}
    end,
    calculate = function(self, card, context)
        if context.after and context.cardarea == G.play then
            if pseudorandom('m_joaf_untextured') < G.GAME.probabilities.normal / card.ability.odds then
                G.E_MANAGER:add_event(Event({
                	func = function()
                        card:set_ability('c_base', nil, true)
                        card:juice_up()
                        return true
                    end
                }))
            end
        end
    end
}
