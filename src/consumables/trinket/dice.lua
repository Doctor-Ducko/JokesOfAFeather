SMODS.Consumable {
    key = "dice",          -- Object ID, acessed with c_joaf_[key]
    atlas = "JOAFTrinkets",        -- Spritesheet to use, initalized in main script
    pos = {x=2, y=2},           -- works on a +1 increment per sprite, not based off of pixels
    set = "Trinkets",           -- Which consumable group to put it in | "Tarot" "Planet" "Spectral" are vanilla, modded sets do not use mod prefix
    cost = 4,                   -- shop price

	unlocked = true,			
	discovered = false,

    loc_txt = {
        name = 'Dice',
        text = {
            "Create a {C:green}D6 Tag"
        }
    },

    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue+1] = {key = "tag_d_six", set = "Tag"}
    end,

    can_use = function(self, card)
        return true
    end,

    use = function(self, card, area)
        add_tag(Tag("tag_d_six"))
    end,
}