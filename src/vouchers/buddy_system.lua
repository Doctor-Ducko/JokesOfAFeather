SMODS.Voucher {
    key = "buddy_system",          -- Object ID, acessed with v_joaf_[key]
    atlas = "JOAFVouchers",     -- Spritesheet to load
    pos = {x = 0, y = 1},       -- Position in spritesheet
    requires = {},              -- A list of keys needed before voucher can spawn, once again with v_joaf_[key] or v_[key] if vanilla

	unlocked = true,			
	discovered = false,

    loc_txt = {
		name = 'Buddy System',
		text = {
			"Play {C:attention}1{}",
            "extra card",
		}
	},

    redeem = function(self, card)
        SMODS.change_play_limit(1)
    end
}