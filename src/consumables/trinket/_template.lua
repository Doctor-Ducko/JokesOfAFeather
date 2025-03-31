SMODS.Consumable {
    key = "_template",          -- Object ID, acessed with c_joaf_[key]
    atlas = "JOAFItems",        -- Spritesheet to use, initalized in main script
    pos = {x=5, y=0},           -- works on a +1 increment per sprite, not based off of pixels
    set = "Trinkets",           -- Which consumable group to put it in | "Tarot" "Planet" "Spectral" are vanilla, modded sets do not use mod prefix
    cost = 4,                   -- shop price

	unlocked = true,			-- Do not change these, they make the jokers visible on mod download
	discovered = true,

    loc_txt = {
        name = 'Template',
        text = {
            "Replace with proper Description",
        }
    },

	config = {
    },

    loc_vars = function(self, info_queue, card)
        return {
            vars = {

            }
        }
    end,

    -- Determines where the consumable can be used, default for Trinket cards
    can_use = function(self, card)
        if G.GAME.blind ~= nil and G.GAME.blind.blind_set  then
            return true
        else 
            return false
        end
    end,

    use = function(self, card, area)

    end
}