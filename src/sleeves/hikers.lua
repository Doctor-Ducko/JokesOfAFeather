CardSleeves.Sleeve {
    key = "hikers",
    atlas = "JOAFSleeves",
    pos = {x = 3, y = 0},
	loc_vars = function(self)
        local key, vars
        if self.get_current_deck_key() == "b_joaf_hikers" then
            key = self.key .. "_alt"
            self.config = {
                win_ante = 16,
                hands = 1,
                discards = 1,
                joker_slot = 1,
                vouchers = {
                    "v_overstock_plus",
                    "v_money_tree",
                    "v_palette",
                }
            }
        else
            key = self.key
            self.config = {
                win_ante = 12,
                hands = 1,
                discards = 1,
                joker_slot = 1,
                vouchers = {
                    "v_overstock_norm",
                    "v_seed_money",
                    "v_paint_brush"
                }
            }
        end
        vars = {
            self.config.joker_slot,
            self.config.hands,
            self.config.discards,
            self.config.win_ante,
        }
        return { key = key, vars = vars }
    end,
    apply = function(self, sleeve)
        G.GAME.win_ante = sleeve.config.win_ante
        CardSleeves.Sleeve.apply(self, sleeve)
    end
}