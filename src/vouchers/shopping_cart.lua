SMODS.Voucher {
    key = "shopping_cart",          -- Object ID, acessed with v_joaf_[key]
    atlas = "JOAFVouchers",     -- Spritesheet to load
    pos = {x = 2, y = 0},       -- Position in spritesheet
    requires = {},              -- A list of keys needed before voucher can spawn, once again with v_joaf_[key] or v_[key] if vanilla

	unlocked = true,			
	discovered = false,

    loc_txt = {
		name = 'Shopping Cart',
		text = {
			"{C:attention}+1{} Booster Pack",
            "slot avaliable in shop"
		}
	},

    redeem = function(self, card)
        SMODS.change_booster_limit(1)
    end
}