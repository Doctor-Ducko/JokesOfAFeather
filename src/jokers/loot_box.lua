SMODS.Joker {
	key = "loot_box",			-- Object ID, acessed with j_joaf_[key]
	atlas = "JOAFJokers",		-- Spritesheet to use, initalized in main script
	pos = {x = 0, y = 0},		-- works on a +1 increment, not based off of pixels
	rarity = 3,					-- 1-Common | 2-Uncommon | 3-Rare | 4-Legendary, string id for modded rarities, found in main script
	cost = 10,					-- shop price
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
		name = "Loot Box",
		text = {
			"In {C:attention}#1#{C:inactive} (#2#){} rounds, sell this",
			"Joker to increase a {C:attention}random",
			"{C:attention}stat permanently{} by {C:attention}#3#",
		}
	},

	-- Variables used in loc_vars and calculate
	config = {
		extra = {
			rounds_to_unlock = 3,
			rounds_left = 3,
			increase = 1
		}
	},

	set_badges = function(self, card, badges)
		--JOAF.reference_badge(card, badges, "deltarune")
	end,
	
	-- Variables to be used in the loc_txt area
	loc_vars = function(self, info_queue, card)
		info_queue[#info_queue+1] = { key = "upgradable_stats", set = "Other" }
		return {
			vars = {
				card.ability.extra.rounds_to_unlock,
				card.ability.extra.rounds_left,
				card.ability.extra.increase,
			}
		}
	end,

	-- look at wiki for info i aint writing it down here
	calculate = function(self, card, context)
		if context.end_of_round and context.cardarea == G.jokers then
			card.ability.extra.rounds_left = card.ability.extra.rounds_left - 1
			if card.ability.extra.rounds_left <= 0 then
				local eval = function(card) return not card.REMOVED end
                juice_card_until(card, eval, true)
				return {
					message = "Ready!"
				}
			end
		end

		if context.selling_self and card.ability.extra.rounds_left <= 0 then
			local upgrade_stat = pseudorandom("j_joaf_loot_box", 1, 6)
			if upgrade_stat == 1 then
        		G.jokers.config.card_limit = G.jokers.config.card_limit + card.ability.extra.increase
				return {
					message = "+1 Joker Slots"
				}
			elseif upgrade_stat == 2 then
				G.GAME.round_resets.hands = G.GAME.round_resets.hands + card.ability.extra.increase
				return {
					message = "+1 Hands",
					colour = G.C.BLUE
				}
			elseif upgrade_stat == 3 then
				G.GAME.round_resets.discards = G.GAME.round_resets.discards + card.ability.extra.increase
				return {
					message = "+1 Discards",
					colour = G.C.RED
				}
			elseif upgrade_stat == 4 then
				G.hand:change_size(card.ability.extra.increase)
				return {
					message = "+1 Hand Size",
					colour = G.C.BLUE
				}
			elseif upgrade_stat == 5 then
				SMODS.change_play_limit(card.ability.extra.increase)
				SMODS.change_discard_limit(card.ability.extra.increase)
				return {
					message = "+1 Selection Limit"
				}
			elseif upgrade_stat == 6 then
				G.consumeables.config.card_limit = G.consumeables.config.card_limit + card.ability.extra.increase
				return {
					message = "+1 Consumable Slot",
					colour = G.C.SECONDARY_SET.TAROT
				}
			end
		end
	end
}