SMODS.Booster {
    key = "quack_normal_2",           -- Class prefix of p, for pack probably
    atlas = "JOAFBoosters",
    pos = {x=1,y=1},
    kind = "quack",      -- Used for multiple packs of the same variety

    cost = 4,
    weight = 1.2,

    config = { extra = 2, choose = 1 },      -- Extra is the amount of cards, and choose is the amount of cards that can be picked

    loc_txt = {
		name = 'Quack Pack',
        group_name = "Quack Pack",
		text = {
            "Choose {C:attention}#1#{} of up to",
            "{C:attention}#2#{} {C:attention}J.O.A.F.{} Jokers",
		}
	},

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                self.config.choose,
                self.config.extra,
            }
        }
    end,

    ease_background_colour = function(self)
        ease_colour(G.C.DYN_UI.MAIN, G.C.GOLD)
		ease_background_colour({ new_colour = G.C.GOLD, special_colour = G.C.BLACK, contrast = 2 })
    end,

    create_card = function(self, card)
		return SMODS.create_card({
            set =               "JOAFJokers",
            area =              G.pack_cards,
            skip_materialize =  true,
            soulable =          true,
        })
	end,
}