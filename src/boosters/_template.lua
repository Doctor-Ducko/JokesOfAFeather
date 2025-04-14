SMODS.Booster {
    key = "_template",           -- Class prefix of p, for pack probably
    atlas = "JOAFBoosters",
    pos = {x=0,y=0},
	discovered = true,
    kind = "template",      -- Used for multiple packs of the same variety
    
    select_card="consumeables",
    cost = 4,
    weight = 1 / 1, --1 base ÷ 1 for each identical pack

    config = { extra = 3, choose = 1 },      -- Extra is the amount of cards, and choose is the amount of cards that can be picked

    loc_txt = {
		name = 'Template',
        group_name = "Template",
		text = {
			"Replace with description",
		}
	},

    create_card = function(self, card)
		return SMODS.create_card({
            set="Trinkets",
            area=G.pack_cards,
            skip_materialize=true,
            soulable=true
        })
	end,
}