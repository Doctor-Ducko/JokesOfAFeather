SMODS.Booster {
    key = "quack_normal_1",           -- Class prefix of p, for pack probably
    atlas = "JOAFBoosters",
    pos = {x=0,y=1},
	discovered = true,
    kind = "quack",      -- Used for multiple packs of the same variety
    
    select_card="jokers",
    cost = 4,
    weight = 1.2,

    config = { extra = 3, choose = 1 },      -- Extra is the amount of cards, and choose is the amount of cards that can be picked

    loc_txt = {
		name = 'Quack Pack',
        group_name = "Quack Pack",
		text = {
			"Testing",
		}
	},

    create_card = function(self, card)
        --('TOGAJKR', G.pack_cards, nil, nil, nil, nil, nil, 'toga')
		return SMODS.create_card({
            set="JOAF_NormalJokers",
            area=G.pack_cards,
            skip_materialize=true,
            soulable=true
        })
	end,
}