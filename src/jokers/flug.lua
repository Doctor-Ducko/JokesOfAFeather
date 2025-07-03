SMODS.Joker {
	key = 'flug',			-- Object ID, acessed with j_joaf_[key]
	atlas = 'JOAFJokers',		-- Spritesheet to use, initalized in main script
	pos = {x = 0, y = 2},		-- works on a +1 increment, not based off of pixels
	soul_pos = { x = 1, y = 2 },
	rarity = 4,					-- 1-Common | 2-Uncommon | 3-Rare | 4-Legendary, string id for modded rarities, found in main script
	cost = 20,					-- shop price
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
		name = 'Flug',
		text = {
			"{X:mult,C:white}X#4#{} Mult and {X:chips,C:white}X#3#{} chips per Ante",
			"Gain {C:red}#5#{} discards and set",
			"hands to {C:blue}#6#{} when Blind is selected",
			"{C:inactive}(Currently {X:mult,C:white}X#2#{C:inactive} Mult and {X:chips,C:white}X#1#{C:inactive} chips)",
		}
	},

	set_badges = function(self, card, badges)
		JOAF.credit_badge(card, badges, "altf4")
	end,

	calculate_x_mult = function(self, card)
		return 1 + (G.GAME.round_resets.ante * card.ability.extra.x_mult_per)
	end,

	calculate_x_chips = function(self, card)
		return 1 + (G.GAME.round_resets.ante * card.ability.extra.x_chips_per)
	end,

	-- Variables used in loc_vars and calculate
	config = {
		extra = {
			x_chips_per = 0.5,
			x_mult_per = 1,
			
			discards = 2,
			set_hands = 1,
		}
	},

	-- Variables to be used in the loc_txt area
	loc_vars = function(self, info_queue, card)
		return {
			vars = {
				self.calculate_x_chips(self, card),
				self.calculate_x_mult(self, card),
				card.ability.extra.x_chips_per,
				card.ability.extra.x_mult_per,
				card.ability.extra.discards,
				card.ability.extra.set_hands,
			}
		}
	end,

	-- look at wiki for info i aint writing it down here
	calculate = function(self, card, context)
		if context.setting_blind and not context.blueprint then
			local hands = G.GAME.round_resets.hands
			G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.1, func = function()
				ease_hands_played((hands * -1) + card.ability.extra.set_hands)
				ease_discard(card.ability.extra.discards)
			return true end }))

			return {}
		end

		if context.joker_main then
			return {
				x_chips = self.calculate_x_chips(self, card),
				x_mult  = self.calculate_x_mult(self, card),
			}
		end

		if context.end_of_round and context.cardarea == G.jokers and context.blind.boss then
			return {
				message = 'Upgraded!',
				colour = G.C.XMULT,
			}
		end
	end
}