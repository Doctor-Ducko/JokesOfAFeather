SMODS.Joker {
	key = 'flug',			-- Object ID, acessed with j_joaf_[key]
	atlas = 'JOAFJokers',		-- Spritesheet to use, initalized in main script
	pos = {x = 0, y = 2},		-- works on a +1 increment, not based off of pixels
	soul_pos = { x = 1, y = 2 },
	rarity = 4,					-- 1-Common | 2-Uncommon | 3-Rare | 4-Legendary, string id for modded rarities, found in main script
	cost = 20,					-- shop price

	blueprint_compat = true,	-- Cosmetic only, define in calculate function
	eternal_compat = true,		-- Self Explanatory
	perishable_compat = true,

	unlocked = true,			-- Do not change these, they make the jokers visible on mod download
	discovered = true,

	-- Display text
	loc_txt = {
		name = 'Flug',
		text = {
			"{X:chips,C:white}X#1#{} chips and {X:mult,C:white}X#2#{} Mult",
			"Gain {C:red}1{} discard and set",
			"hands to {C:blue}#4#{} when Blind",
			"is selected",
		}
	},

	set_badges = function(self, card, badges)
		credit_badge(card, badges, "Hydrop0x", G.C.HYDROP0X)
	end,

	-- Variables used in loc_vars and calculate
	config = {
		extra = {
			x_chips = 4,
			x_mult = 4,
			discards = 1,
			set_hands = 1,
		}
	},
	-- Variables to be used in the loc_txt area
	loc_vars = function(self, info_queue, card)
		return {
			vars = {
				card.ability.extra.x_chips,
				card.ability.extra.x_mult,
				card.ability.extra.discards,
				card.ability.extra.set_hands,
			}
		}
	end,

	-- look at wiki for info i aint writing it down here
	calculate = function(self, card, context)
		if context.setting_blind then
			local hands = G.GAME.round_resets.hands
			G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.1, func = function()
				ease_hands_played((hands * -1) + card.ability.extra.set_hands)
				ease_discard(card.ability.extra.discards)
			return true end }))

			return {}
		end
		if context.joker_main then
			return {
				x_chips = card.ability.extra.x_chips,
				x_mult = card.ability.extra.x_mult,
			}
		end
	end
}