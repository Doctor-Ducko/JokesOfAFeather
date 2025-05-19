SMODS.Back{
    key = "hikers",                  -- Object id, acessed with b_joaf_[key]
	atlas = 'JOAFDecks',                -- Atlas to use, do not change
    pos = {x = 3, y = 0},               -- pos on atlas
    
    loc_txt = {
        name = "Hiker's Deck",
        text ={
            "Start with {C:attention,T:v_overstock_norm}Overstock{}, {C:attention,T:v_crystal_ball}Crystal Ball{},",
            "{C:attention,T:v_seed_money}Seed Money{} and {C:attention,T:v_paint_brush}Paint Brush{}.",
            "{C:attention}+2{} Joker slots, hands, & discards.",
            "Winning Ante is {C:attention}16{}",
        },
    },

    config = {
        hands = 2,
		discards = 2,
		joker_slot = 2,
        vouchers = {
            "v_overstock_norm",
            "v_crystal_ball",
            "v_seed_money",
            "v_paint_brush"
        }
    },

    apply = function()
        G.GAME.win_ante = 16
    end
}