SMODS.Back{
    key = "hikers",                  -- Object id, acessed with b_joaf_[key]
	atlas = 'JOAFDecks',                -- Atlas to use, do not change
    pos = {x = 3, y = 0},               -- pos on atlas
    
    loc_txt = {
        name = "Hiker's Deck",
        text ={
            "Start with {C:attention,T:v_overstock_norm}Overstock{}, {C:attention,T:v_seed_money}Seed Money{},",
            "and {C:attention,T:v_paint_brush}Paint Brush{}.",
            "{C:attention}+#1#{} Joker slot, {C:blue}+#1#{} hand, {C:red}+#1#{} discard.",
            "Winning Ante is {C:attention}#4#{}",
        },
    },

    config = {
        win_ante = 12,
        hands = 1,
		discards = 1,
		joker_slot = 1,
        vouchers = {
            "v_overstock_norm",
            "v_seed_money",
            "v_paint_brush"
        }
    },

	loc_vars = function(self)
        return { vars = {
            self.config.joker_slot,
            self.config.hands,
            self.config.discards,
            self.config.win_ante,
        }}
    end,

    apply = function(self)
        G.GAME.win_ante = self.config.win_ante
    end
}