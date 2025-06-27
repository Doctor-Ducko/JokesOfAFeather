SMODS.Voucher {
    key = "couch_co_op",          -- Object ID, acessed with v_joaf_[key]
    atlas = "JOAFVouchers",     -- Spritesheet to load
    pos = {x = 1, y = 1},       -- Position in spritesheet
    requires = {"v_joaf_buddy_system"},              -- A list of keys needed before voucher can spawn, once again with v_joaf_[key] or v_[key] if vanilla

	unlocked = true,			
	discovered = false,

    loc_txt = {
		name = 'Couch Co-Op',
		text = {
			"Play {C:attention}1{}",
            "extra card",
		}
	},

    redeem = function(self, card)
        SMODS.change_play_limit(1)
    end
}