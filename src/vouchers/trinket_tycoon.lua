SMODS.Voucher {
    key = "trinket_tycoon",   -- Object ID, acessed with v_joaf_[key]
    atlas = "JOAFVouchers",     -- Spritesheet to load
    pos = {x = 1, y = 0},       -- Position in spritesheet
    requires = {"v_joaf_trinket_merchant"},              -- A list of keys needed before voucher can spawn, once again with v_joaf_[key] or v_[key] if vanilla

	unlocked = true,			-- Do not cshange these, they make the jokers visible on mod download
	discovered = true,

    loc_txt = {
		name = 'Trinket Tycoon',
		text = {
			"{C:attention}Trinket{} cards appear",
			"{C:attention}4X{} more frequently",
			"in the shop",
		}
	},

    redeem = function(self, card)
		G.GAME["trinkets_rate"] = G.GAME["trinkets_rate"] * 2
    end
}