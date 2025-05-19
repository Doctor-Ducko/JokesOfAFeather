SMODS.Joker {
	key = 'jramp',			-- Object ID, acessed with j_joaf_[key]
	atlas = 'JOAFJokers',		-- Spritesheet to use, initalized in main script
	pos = {x = 10, y = 1},		-- works on a +1 increment, not based off of pixels
	rarity = 3,					-- 1-Common | 2-Uncommon | 3-Rare | 4-Legendary, string id for modded rarities, found in main script
	cost = 8,					-- shop price

	blueprint_compat = true,	-- Cosmetic only, define in calculate function
	eternal_compat = true,		-- Self Explanatory
	perishable_compat = true,

	unlocked = true,			-- Do not change these, they make the jokers visible on mod download
	discovered = false,

	-- Display text
	loc_txt = {
		name = 'Jramp',
		text = {
			"Gives X-Mult equal to",
			"{C:attention}half of the current Ante{}",
			"unless Ante is less than 2",
			"{C:inactive}(Updates after leaving the shop)",
			"{C:inactive}(Currently {X:mult,C:white}X#1#{}{C:inactive} Mult)",
		}
	},

	set_badges = function(self, card, badges)
		JOAF.credit_badge(card, badges, "Chilli", G.C.CHILLI)
	end,
	
	calculate_x_mult = function()
		local ante = G.GAME.round_resets.ante
		local value = 1
		if ante > 2 then
			value = ante / 2
		end
		return value
	end,

	-- Variables used in loc_vars and calculate
	config = {
		extra = {
			x_mult = 1,
			previous_x_mult = 1
		}
	},

	add_to_deck = function(self, card, from_debuff)
		card.ability.extra.x_mult = self.calculate_x_mult()
		card.ability.extra.previous_x_mult = self.calculate_x_mult()
	end,

	-- Variables to be used in the loc_txt area
	loc_vars = function(self, info_queue, card)
		return {
			vars = {
				card.ability.extra.x_mult
			}
		}
	end,

	-- look at wiki for info i aint writing it down here
	calculate = function(self, card, context)
		if context.joker_main then
			return {
				x_mult = card.ability.extra.x_mult
			}
		end
		if context.ending_shop and not context.blueprint then
			card.ability.extra.x_mult = self.calculate_x_mult()
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