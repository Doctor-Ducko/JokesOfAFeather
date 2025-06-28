SMODS.Booster {
    key = "family_normal",           -- Class prefix of p, for pack probably
    atlas = "JOAFBoosters",
    pos = {x=0,y=2},
    kind = "family",      -- Used for multiple packs of the same variety

    cost = 10,
    weight = 0.1,

    config = { extra = 2, choose = 1 },      -- Extra is the amount of cards, and choose is the amount of cards that can be picked

    loc_txt = {
		name = 'Family Pack',
        group_name = "Family Pack",
		text = {
            "Choose {C:attention}#1#{} of up to",
            "{C:attention}#2#{} {C:joaf_family}Family Guy{} Jokers",
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
        ease_colour(G.C.DYN_UI.MAIN, HEX("3F8542"))
		ease_background_colour({ new_colour = HEX("3F8542"), special_colour = G.C.BLACK, contrast = 2 })
    end,

    create_card = function(self, card)
		return SMODS.create_card({
            set =               "Joker",
            area =              G.pack_cards,
            rarity =            "joaf_family",
            skip_materialize =  true,
            soulable =          true,
        })
	end,
}