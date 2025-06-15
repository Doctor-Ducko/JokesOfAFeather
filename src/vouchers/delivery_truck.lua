SMODS.Voucher {
    key = "delivery_truck",          -- Object ID, acessed with v_joaf_[key]
    atlas = "JOAFVouchers",     -- Spritesheet to load
    pos = {x = 3, y = 0},       -- Position in spritesheet
    requires = {"v_joaf_shopping_cart"},              -- A list of keys needed before voucher can spawn, once again with v_joaf_[key] or v_[key] if vanilla

	unlocked = true,			
	discovered = false,

    loc_txt = {
		name = 'Delivery Truck',
		text = {
			"{C:attention}+1{} Voucher slot",
            "avaliable in shop"
		}
	},

    redeem = function(self, card)
        SMODS.change_voucher_limit(1)
    end
}