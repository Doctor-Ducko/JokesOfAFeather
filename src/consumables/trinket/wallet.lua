SMODS.Consumable {
    key = "wallet",          -- Object ID, acessed with c_joaf_[key]
    atlas = "JOAFItems",        -- Spritesheet to use, initalized in main script
    pos = {x=8, y=0},           -- works on a +1 increment per sprite, not based off of pixels
    set = "Trinkets",           -- Which consumable group to put it in | "Tarot" "Planet" "Spectral" are vanilla, modded sets do not use mod prefix
    cost = 4,                   -- shop price

	unlocked = true,			
	discovered = false,

    loc_txt = {
        name = 'Wallet',
        text = {
            "Gain between",
            "{C:money}$#1#{} and {C:money}$#2#{}",
        }
    },

	config = {
        money_low = 2,
        money_high = 8
    },

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                self.config.money_low,
                self.config.money_high,
            }
        }
    end,

    -- Determines where the consumable can be used, default for Trinket cards
    can_use = function(self, card)
        return true
    end,

    use = function(self, card, area)
        ease_dollars(math.random(card.ability.money_low,card.ability.money_high))
    end
}