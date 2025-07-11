SMODS.Enhancement{
    key = "shy",

	loc_txt = {
        name = "Shy Card",
        text ={
            "{X:mult,C:white}X#1#{} Mult",
            "when unscored"
        },
	},

	atlas = 'JOAFEnhance',
	pos = {x = 0, y = 1},
	config = {
		u_x_mult = 2.5
    },
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.u_x_mult
            }
        }
    end,
    calculate = function(self, card, context)
        if context.cardarea == "unscored" and context.main_scoring then
            return {
                x_mult = card.ability.u_x_mult
            }
        end
    end,
    set_badges = function(self, card, badges)
        JOAF.credit_badge(card, badges, "altf4")
    end
}
