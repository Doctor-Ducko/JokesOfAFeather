SMODS.Booster {
    key = "trinket_mega_1",           -- Class prefix of p, for pack probably
    atlas = "JOAFBoosters",
    pos = {x=3,y=0},
	discovered = true,
    kind = "trinket",      -- Used for multiple packs of the same variety
    
    select_card="consumeables",
    cost = 8,
    weight = 0.25,

    config = { extra = 5, choose = 2 },      -- Extra is the amount of cards, and choose is the amount of cards that can be picked

    loc_txt = {
		name = 'Mega Trinket Pack',
        group_name = "Mega Trinket Pack",
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