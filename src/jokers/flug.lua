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
	discovered = false,

	-- Display text
	loc_txt = {
		name = 'Flug',
		text = {
			"{X:chips,C:white}+X0.5{} chips and {X:mult,C:white}+X1{} Mult per Ante",
			"Gain {C:red}#3#{} discards and set",
			"hands to {C:blue}#4#{} when Blind is selected",
			"{C:inactive}(Updates after leaving the shop)",
			"{C:inactive}(Currently {X:mult,C:white}X#2#{C:inactive} Mult and {X:chips,C:white}X#1#{C:inactive} chips)",
		}
	},

	set_badges = function(self, card, badges)
		JOAF.credit_badge(card, badges, "Hydrop0x", G.C.HYDROP0X)
	end,

	calculate_x_mult = function()
		local ante = G.GAME.round_resets.ante
		return ante + 1
	end,

	calculate_x_chips = function ()
		local ante = G.GAME.round_resets.ante
		return (ante/2) + 1
	end,

	-- Variables used in loc_vars and calculate
	config = {
		extra = {
			x_chips = 1.5,
			x_mult = 2,
			
			discards = 2,
			set_hands = 1,

			previous_x_chips = 1,
			previous_x_mult = 1,
		}
	},

	add_to_deck = function(self, card, from_debuff)
		card.ability.extra.x_mult = self.calculate_x_mult()
		card.ability.extra.x_chips = self.calculate_x_chips()
		card.ability.extra.previous_x_mult = self.calculate_x_mult()
	end,

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
				x_chips = card.ability.extra.x_chips,
				x_mult = card.ability.extra.x_mult,
			}
		end

		if context.ending_shop and not context.blueprint then
			-- we only need to check for 1 because they get upgraded at the same time
			card.ability.extra.x_mult = self.calculate_x_mult()
			card.ability.extra.x_chips = self.calculate_x_chips()
			if card.ability.extra.x_mult ~= card.ability.extra.previous_x_mult then
				card.ability.extra.previous_x_mult = card.ability.extra.x_mult
				return {
					message = 'Upgraded!',
					colour = G.C.XMULT,
					card = card
				}
			else
				return {}
			end
		end
	end
}