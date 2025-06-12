SMODS.Joker {
	key = 'comedian',			-- Object ID, acessed with j_joaf_[key]
	atlas = 'JOAFJokers',		-- Spritesheet to use, initalized in main script
	pos = {x = 1, y = 3},		-- works on a +1 increment, not based off of pixels
	rarity = 3,					-- 1-Common | 2-Uncommon | 3-Rare | 4-Legendary, string id for modded rarities, found in main script
	cost = 10,					-- shop price

	blueprint_compat = true,	-- Cosmetic only, define in calculate function
	eternal_compat = true,		-- Self Explanatory
	perishable_compat = true,

	unlocked = true,			-- Do not change these, they make the jokers visible on mod download
	discovered = false,

	-- Display text
	loc_txt = {
		name = 'Comedian',
		text = {
			"Upgrades a {C:attention}random stat{} by a",
			"{C:attention}random amount{} when",
			"a {C:attention}#5#{} is scored",
			"{C:inactive}({C:chips}+#1#{}{C:inactive} | {X:chips,C:white}X#3#{}{C:inactive} chips)",
			"{C:inactive}({C:mult}+#2#{}{C:inactive} | {X:mult,C:white}X#4#{}{C:inactive} Mult)",
		}
	},

	-- Variables used in loc_vars and calculate
	config = {
		extra = {
			-- Required hand
			poker_hand = "High Card",

			-- Current stats
			chips 		= 0,
			mult 		= 0,
			x_chips 	= 1,
			x_mult 		= 1,

			increment_ranges = {
				chips 	= {10,50},
				mult 	= {1,20},
				x_chips = {10,50},
				x_mult 	= {10,50},
			},
			
			stats = {"chips", "mult", "x_chips", "x_mult"}
		}
	},
	-- Variables to be used in the loc_txt area
	loc_vars = function(self, info_queue, card)
		return {
			vars = {
				card.ability.extra.chips,
				card.ability.extra.mult,
				card.ability.extra.x_chips,
				card.ability.extra.x_mult,
				card.ability.extra.poker_hand,
			}
		}
	end,

	add_to_deck = function(self, card, from_debuff)
		card.ability.extra.poker_hand = pseudorandom_element(JOAF.get_valid_poker_hands(card.ability.extra.poker_hand), pseudoseed("j_joaf_comedian_new_poker_hand"))
	end,

	-- look at wiki for info i aint writing it down here
	calculate = function(self, card, context)
		-- ALL FOR INCREASING A STAT
		-- FAWKING CHRIST
		if context.before and context.main_eval and context.scoring_name == card.ability.extra.poker_hand and not context.blueprint then
			-- So the stat we want to increase starts as a random acceptable stat
			local increase_stat = pseudorandom_element(card.ability.extra.stats, pseudoseed("j_joaf_comedian_increase_stat"))
			-- get stat ranges
			local increase_range = card.ability.extra.increment_ranges[increase_stat]

			if increase_stat == "x_mult" or increase_stat == "x_chips" then
				card.ability.extra[increase_stat] = card.ability.extra[increase_stat] + math.random(increase_range[1],increase_range[2]) / 100
			else
				card.ability.extra[increase_stat] = card.ability.extra[increase_stat] + math.random(increase_range[1],increase_range[2])
			end


			if increase_stat == "chips" or increase_stat == "x_chips" then
				return {
					colour = G.C.CHIPS,
					message = "Upgrade!"
				}
			else
				return {
					colour = G.C.MULT,
					message = "Upgrade!"
				}
			end
        end

		-- Main scoring
		if context.joker_main then
			return {
				chips	= card.ability.extra.chips,
				mult 	= card.ability.extra.mult,
				x_chips = card.ability.extra.x_chips,
				x_mult 	= card.ability.extra.x_mult
			}
		end

		-- Resets the hand needed
		if context.end_of_round and context.main_eval and not context.blueprint then
			card.ability.extra.poker_hand = pseudorandom_element(JOAF.get_valid_poker_hands(card.ability.extra.poker_hand), pseudoseed("j_joaf_comedian_new_poker_hand"))
			return {
                message = "Reset",
				card = card
            }
		end
	end
}