SMODS.Voucher {
    key = "dumpster",          -- Object ID, acessed with v_joaf_[key]
    atlas = "JOAFVouchers",     -- Spritesheet to load
    pos = {x = 3, y = 1},       -- Position in spritesheet
    requires = {"v_joaf_trash_bin"},              -- A list of keys needed before voucher can spawn, once again with v_joaf_[key] or v_[key] if vanilla

	unlocked = true,			
	discovered = false,

    loc_txt = {
		name = 'Dumpster',
		text = {
			"Discard {C:attention}1{}",
            "extra card",
		}
	},

    redeem = function(self, card)
        SMODS.change_discard_limit(1)
    end
}