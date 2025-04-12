SMODS.Joker {
	key = 'monster',			-- Object ID, acessed with j_joaf_[key]
	atlas = 'JOAFJokers',		-- Spritesheet to use, initalized in main script
	pos = {x = 5, y = 2},		-- works on a +1 increment, not based off of pixels
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
		name = 'Monster',
		text = {
			"Gives {X:mult,C:white}X#1#{} Mult",
			"for each {C:attention}round{} played",
			"{C:inactive}(Currently {X:mult,C:white}X#2#{}{C:inactive} Mult)",
		}
	},

	-- Variables used in loc_vars and calculate
	config = {
		extra = {
			x_mult_increase = 0.2,
			-- please work
			x_mult = 1,
		}
	},

	add_to_deck = function(self, card, from_debuff)
		card.ability.extra.x_mult = (G.GAME.round * card.ability.extra.x_mult_increase) + 1
	end,

	-- Variables to be used in the loc_txt area
	loc_vars = function(self, info_queue, card)
		return {
			vars = {
				card.ability.extra.x_mult_increase,
				card.ability.extra.x_mult,
			}
		}
	end,

	calculate = function(self, card, context)
		if context.joker_main then
			return {
				x_mult = card.ability.extra.x_mult
			}
		end
		if context.setting_blind then
			card.ability.extra.x_mult = (G.GAME.round * card.ability.extra.x_mult_increase) + 1
		end
	end
}