SMODS.Seal {
    key = "pink",
    badge_colour = HEX("eb6abd"),
	config = {x_mult = 1.5},
    loc_txt = {
        label = 'Pink Seal',
        name = 'Pink Seal',
        text = {
            '{X:mult,C:white}X#1#{} Mult when this',
			'card is scored'
        }
    },
    loc_vars = function(self, info_queue)
        return { vars = {self.config.x_mult, } }
    end,
    atlas = "JOAFEnhance",
    pos = {x=2, y=0},

    -- self - this seal prototype
    -- card - card this seal is applied to
    calculate = function(self, card, context)
        -- main_scoring context is used whenever the card is scored
        if context.main_scoring and context.cardarea == G.play then
            return {
                x_mult = self.config.x_mult
            }
        end
    end,
}