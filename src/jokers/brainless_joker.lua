SMODS.Joker {
	key = "brainless_joker",			-- Object ID, acessed with j_joaf_[key]
	atlas = "JOAFJokers",		-- Spritesheet to use, initalized in main script
	pos = {x = 4, y = 1},		-- works on a +1 increment, not based off of pixels
	rarity = 2,					-- 1-Common | 2-Uncommon | 3-Rare | 4-Legendary, string id for modded rarities, found in main script
	cost = 6,					-- shop price
	pools = {
		["JOAFJokers"] = true
	},

	blueprint_compat = true,	-- Cosmetic only, define in calculate function
	eternal_compat = true,		-- Self Explanatory
	perishable_compat = true,

	unlocked = true,			-- Do not change these, they make the jokers visible on mod download
	discovered = false,

	-- Display text
	loc_txt = {
		name = "Brainless Joker",
		text = {
			"Gains {X:mult,C:white}X#1#{} Mult when a",
			"{C:attention}Dynamite Card{} explodes",
			"{C:inactive}(Currently {X:mult,C:white}X#2#{C:inactive} Mult)",
			"{C:inactive,s:0.8}(hehe dynamite go boom boom)",
		}
	},

	-- Variables used in loc_vars and calculate
	config = {
		extra = {
			xmult_gain = 0.5,
			xmult = 1,
		}
	},
	-- Variables to be used in the loc_txt area
	loc_vars = function(self, info_queue, card)
		info_queue[#info_queue+1] = G.P_CENTERS.m_joaf_dynamite
		return {
			vars = {
				card.ability.extra.xmult_gain,
				card.ability.extra.xmult,
			}
		}
	end,

	-- look at wiki for info i aint writing it down here
	calculate = function(self, card, context)
		if context.individual and context.cardarea == G.play and context.other_card.exploding and not context.blueprint then
            card.ability.extra.xmult = card.ability.extra.xmult + card.ability.extra.xmult_gain
            return {
                message = localize('k_upgrade_ex'),
                colour = G.C.MULT,
                message_card = card
            }
        end
		if context.joker_main then
			return {
				xmult = card.ability.extra.xmult
			}
		end
	end
}