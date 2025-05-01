SMODS.Voucher {
    key = "_template",          -- Object ID, acessed with v_joaf_[key]
    atlas = "JOAFVouchers",     -- Spritesheet to load
    pos = {x = 0, y = 0},       -- Position in spritesheet
    requires = {},              -- A list of keys needed before voucher can spawn, once again with v_joaf_[key] or v_[key] if vanilla

	unlocked = true,			-- Do not change these, they make the jokers visible on mod download
	discovered = true,

    loc_txt = {
		name = 'Template',
		text = {
			"Replace with description",
		}
	},

    redeem = function(self, card)

    end
}