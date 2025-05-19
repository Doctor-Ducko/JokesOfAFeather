SMODS.Consumable {
    key = "_template",          -- Object ID, acessed with c_joaf_[key]
    atlas = "JOAFItems",        -- Spritesheet to use, initalized in main script
    pos = {x=5, y=0},           -- works on a +1 increment per sprite, not based off of pixels
    set = "Tarot",           -- Which consumable group to put it in | "Tarot" "Planet" "Spectral" are vanilla, modded sets do not use mod prefix
    cost = 4,                   -- shop price

	unlocked = true,			
	discovered = false,

    loc_txt = {
        name = 'Template',
        text = {
            "Replace with proper Description",
        }
    },

	config = {
        max_highlighted = 1
    },

    loc_vars = function(self, info_queue, card)
        return {
            vars = {

            }
        }
    end,

    -- Determines where the consumable can be used, default for Trinket cards
	can_use = function(self, card)
		if G.hand and (#G.hand.highlighted >= 1) and (#G.hand.highlighted <= card.ability.max_highlighted) then
			return true
		end
		return false
	end,

    use = function(self, card, area)

    end
}