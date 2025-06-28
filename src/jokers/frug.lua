SMODS.Joker {
	key = "frug",			-- Object ID, acessed with j_joaf_[key]
	atlas = "JOAFJokers",		-- Spritesheet to use, initalized in main script
	pos = {x = 6, y = 2},		-- works on a +1 increment, not based off of pixels
	rarity = 1,					-- 1-Common | 2-Uncommon | 3-Rare | 4-Legendary, string id for modded rarities, found in main script
	cost = 5,					-- shop price
	pools = {
		["JOAFJokers"] = true
	},

	blueprint_compat = true,	-- Cosmetic only, define in calculate function
	eternal_compat = true,		-- Self Explanatory
	perishable_compat = false,

	unlocked = true,			-- Do not change these, they make the jokers visible on mod download
	discovered = false,

	-- Display text
	loc_txt = {
		name = "Frug",
		text = {
			"{C:attention}+#1#{} Joker Slot and {C:mult}+#5#{} Mult",
            "{C:mult}+#2#{} Mult per copy",
            "{X:mult,C:white}+X#3#{} Mult per #4# copies",
            "Multiple copies can {C:attention}appear in the shop{}"
		}
	},

	set_badges = function(self, card, badges)
		JOAF.credit_badge(card, badges, "chilli")
	end,

	-- Variables used in loc_vars and calculate
	config = {
		extra = {
            joker_slots = 1,
            mult_per = 1,
            xmult_per = 0.5,
			xmult_req = 5,
			base_mult = 5,
		}
	},
	-- Variables to be used in the loc_txt area
	loc_vars = function(self, info_queue, card)
		return {
			vars = {
				card.ability.extra.joker_slots,
				card.ability.extra.mult_per,
				card.ability.extra.xmult_per,
				card.ability.extra.xmult_req,
				card.ability.extra.base_mult,
			}
		}
	end,

    in_pool = function(self, args)
        return true, { allow_duplicates = true }
    end,

	add_to_deck = function(self, card, from_debuff)
		G.jokers.config.card_limit = G.jokers.config.card_limit + card.ability.extra.joker_slots
	end,
	remove_from_deck = function(self, card, from_debuff)
		G.jokers.config.card_limit = G.jokers.config.card_limit - card.ability.extra.joker_slots
	end,

	-- look at wiki for info i aint writing it down here
	calculate = function(self, card, context)
		if context.joker_main then
			return {
				mult = card.ability.extra.base_mult + ((card.ability.extra.mult_per * #SMODS.find_card("j_joaf_frug", true)) - 1),
                x_mult = (card.ability.extra.xmult_per * math.floor(#SMODS.find_card("j_joaf_frug", true) / card.ability.extra.xmult_req)) + 1,
			}
		end
	end
}