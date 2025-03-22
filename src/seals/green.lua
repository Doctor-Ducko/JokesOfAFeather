SMODS.Seal {
    key = "green",
    badge_colour = G.C.GREEN,
	config = {extra_cards = 2},
    loc_txt = {
        label = 'Green Seal',
        -- Tooltip description
        name = 'Green Seal',
        text = {
            'Draw {C:attention}#1#{} extra cards',
			'on discard',
			"{C:inactive}(May or may not be",
			"{C:inactive}kind of janky)"
        }
    },
    loc_vars = function(self, info_queue)
        return { vars = {self.config.extra_cards, } }
    end,
    atlas = "JOAFEnhance",
    pos = {x=3, y=0},

    -- self - this seal prototype
    -- card - card this seal is applied to
    calculate = function(self, card, context)
        if context.discard and context.other_card == card then
			G.FUNCS.draw_from_deck_to_hand(self.config.extra_cards + 1)
            return {
                card = card
            }
        end
    end
}