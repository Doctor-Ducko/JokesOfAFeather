SMODS.Joker {
	key = 'emperor',			-- Object ID, acessed with j_joaf_[key]
	atlas = 'JOAFJokers',		-- Spritesheet to use, initalized in main script
	pos = {x = 5, y = 2},		-- works on a +1 increment, not based off of pixels
	soul_pos = { x = 5, y = 3 },
	rarity = 4,					-- 1-Common | 2-Uncommon | 3-Rare | 4-Legendary, string id for modded rarities, found in main script
	cost = 20,					-- shop price

	blueprint_compat = true,	-- Cosmetic only, define in calculate function
	eternal_compat = true,		-- Self Explanatory
	perishable_compat = true,

	unlocked = true,			-- Do not change these, they make the jokers visible on mod download
	discovered = false,
	-- Display text
	loc_txt = {
		name = 'Emperor',
		text = {
			"Gives {X:dark_edition,C:white}^#1#{} Mult",
			"for each {C:attention}round{} played",
			"{C:inactive}(Currently {X:dark_edition,C:white}^#2#{}{C:inactive} Mult)",
		}
	},

	-- Variables used in loc_vars and calculate
	config = {
		extra = {
			e_mult_increase = 0.01,
			e_mult = 1,
		}
	},

	add_to_deck = function(self, card, from_debuff)
		card.ability.extra.e_mult = (G.GAME.round * card.ability.extra.e_mult_increase) + 1
	end,

	-- Variables to be used in the loc_txt area
	loc_vars = function(self, info_queue, card)
		return {
			vars = {
				card.ability.extra.e_mult_increase,
				card.ability.extra.e_mult,
			}
		}
	end,

	-- look at wiki for info i aint writing it down here
	calculate = function(self, card, context)
		if context.joker_main then
			return {
				e_mult = card.ability.extra.e_mult
			}
		end
		if context.setting_blind and not context.blueprint then
			card.ability.extra.e_mult = (G.GAME.round * card.ability.extra.e_mult_increase) + 1
			return {
				message = "Upgrade!",
				colour = G.C.MULT
			}
		end
	end
}