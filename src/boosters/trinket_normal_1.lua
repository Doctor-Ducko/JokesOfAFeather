SMODS.Booster {
    key = "trinket_normal_1",           -- Class prefix of p, for pack probably
    atlas = "JOAFBoosters",
    pos = {x=0,y=0},
	discovered = true,
    kind = "trinket",      -- Used for multiple packs of the same variety
    
    select_card="consumeables",
    cost = 4,
    weight = 2,

    config = { extra = 3, choose = 1 },      -- Extra is the amount of cards, and choose is the amount of cards that can be picked

    loc_txt = {
		name = 'Trinket Pack',
        group_name = "Trinket Pack",
		text = {
            "Choose {C:attention}#1#{} of up to",
            "{C:attention}#2# Trinket{} cards to",
            "hold on to",
		}
	},

    loc_vars = function(self, info_queue, card)
		return {
			vars = {
				self.config.choose,
				self.config.extra,
			},
		}
	end,

    create_card = function(self, card)
		return SMODS.create_card({
            set="Trinkets",
            area=G.pack_cards,
            skip_materialize=true,
            soulable=true
        })
	end,
}