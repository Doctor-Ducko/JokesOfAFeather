

SMODS.Joker {
	key = 'mia_joker',			-- Object ID, acessed with j_joaf_[key]
	atlas = 'JOAFJokers',		-- Spritesheet to use, initalized in main script
	pos = {x = 0, y = 0},		-- works on a +1 increment, not based off of pixels
	rarity = 3,					-- 1-Common | 2-Uncommon | 3-Rare | 4-Legendary, string id for modded rarities, found in main script
	cost = 7,					-- shop price

	blueprint_compat = false,	-- Cosmetic only, define in calculate function
	eternal_compat = true,		-- Self Explanatory
	perishable_compat = true,

	unlocked = true,			-- Do not change these, they make the jokers visible on mod download
	discovered = false,

	-- Display text
	loc_txt = {
		name = 'M.I.A. Joker',
		text = {
			"{C:attention}+1{} Joker slot",
			"{C:inactive}(Is, is that really it?){}",
			"{s:0.75,C:inactive}(No){}",
		}
	},

	-- Variables used in loc_vars and calculate
	config = {
		extra = {
			joker_slots = 1,
			random_events = 6,
			current_event = 1
		}
	},
	-- Variables to be used in the loc_txt area
	loc_vars = function(self, info_queue, card)
		return {
			vars = {
				card.ability.extra.joker_slots
			}
		}
	end,

	add_to_deck = function(self, card, from_debuff)
		G.jokers.config.card_limit = G.jokers.config.card_limit + card.ability.extra.joker_slots
	end,
	remove_from_deck = function(self, card, from_debuff)
		G.jokers.config.card_limit = G.jokers.config.card_limit - card.ability.extra.joker_slots
	end,

	-- look at wiki for info i aint writing it down here
	calculate = function(self, card, context)
		if not context.blueprint then
			if context.ending_shop then
				card.ability.extra.current_event = pseudorandom("j_joaf_mia_joker_random_event", 1, card.ability.extra.random_events + 1)
			end
			if context.joker_main then
				local event = card.ability.extra.current_event
				if event == 1 then
					return {
						chips = 300
					}
				elseif event == 2 then
					return {
						mult = 100
					}
				elseif event == 3 then
					return {
						x_mult = 8
					}
				elseif event == 4 then
					return {
						x_chips = 6
					}
				elseif event == 5 then
					if JOAF.has_talisman then
						return {
							e_mult = 1.25
						}
					else
						return {
							x_mult = 32
						}
					end
				elseif event == 6 then
					if JOAF.has_talisman then
						return {
							e_chips = 1.25
						}
					else
						return {
							x_chips = 24
						}
					end
				else
					return {
						message = "Nothing?!"
					}
				end
			end
		end
	end
}