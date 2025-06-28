SMODS.Joker {
	key = 'money_smart',			-- Object ID, acessed with j_joaf_[key]
	atlas = 'JOAFJokers',		-- Spritesheet to use, initalized in main script
	pos = {x = 4, y = 2},		-- works on a +1 increment, not based off of pixels
	soul_pos = { x = 6, y = 3 },
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
		name = 'Money Smart',
		text = {
			"Gives {X:mult,C:white}X#1#{} Mult",
			"for each {C:money}$#3#{} owned",
			"{C:inactive}(Updates before Jokers get scored)",
			"{C:inactive}(Currently {X:mult,C:white}X#2#{}{C:inactive} Mult)",
		}
	},

	set_badges = function(self, card, badges)
		JOAF.credit_badge(card, badges, "chilli")
	end,

	-- Variables used in loc_vars and calculate
	config = {
		extra = {
			x_mult_increase = 0.25,
			x_mult = 1,
			dollars_needed = 5,
		}
	},

	add_to_deck = function(self, card, from_debuff)
		card.ability.extra.x_mult = (math.floor(to_number(G.GAME.dollars)/card.ability.extra.dollars_needed) * card.ability.extra.x_mult_increase) + 1
	end,

	-- Variables to be used in the loc_txt area
	loc_vars = function(self, info_queue, card)
		return {
			vars = {
				card.ability.extra.x_mult_increase,
				card.ability.extra.x_mult,
				card.ability.extra.dollars_needed,
			}
		}
	end,

	calculate = function(self, card, context)
		if context.joker_main then
			return {
				x_mult = card.ability.extra.x_mult
			}
		end
		if context.pre_joker and not context.blueprint then
			card.ability.extra.x_mult = (math.floor(to_number(G.GAME.dollars)/card.ability.extra.dollars_needed) * card.ability.extra.x_mult_increase) + 1
		end
	end
}