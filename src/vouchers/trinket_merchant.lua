SMODS.Voucher {
    key = "trinket_merchant",   -- Object ID, acessed with v_joaf_[key]
    atlas = "JOAFVouchers",     -- Spritesheet to load
    pos = {x = 0, y = 0},       -- Position in spritesheet
    requires = {},              -- A list of keys needed before voucher can spawn, once again with v_joaf_[key]

	unlocked = true,			-- Do not cshange these, they make the jokers visible on mod download
	discovered = true,

    loc_txt = {
		name = 'Trinket Merchant',
		text = {
			"{C:attention}Trinket{} cards appear",
			"{C:attention}2X{} more frequently",
			"in the shop",
		}
	},

    redeem = function(self, card)

    end
}