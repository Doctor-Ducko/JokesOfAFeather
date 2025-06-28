SMODS.Joker {
	key = 'jimbo_jpg',			-- Object ID, acessed with j_joaf_[key]
	atlas = 'JOAFJokers',		-- Spritesheet to use, initalized in main script
	pos = {x = 2, y = 2},		-- works on a +1 increment, not based off of pixels
	rarity = 2,					-- 1-Common | 2-Uncommon | 3-Rare | 4-Legendary, string id for modded rarities, found in main script
	cost = 7,					-- shop price
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
		name = 'jimbo.jpg',
		text = {
			"Scored cards in the",
			"{C:attention}first{} hand of round",
			"have a {C:green}#1# in #2#{} chance to",
			"{C:attention}lose their textures{}",
		}
	},

	-- Variables used in loc_vars and calculate
	config = {
		extra = {
			odds = 5,
		}
	},

	loc_vars = function(self, info_queue, card)
		info_queue[#info_queue+1] = G.P_CENTERS.m_joaf_untextured
		return {
			vars = {
				G.GAME.probabilities.normal,
				card.ability.extra.odds,
			}
		}
	end,

	-- look at wiki for info i aint writing it down here
	calculate = function(self, card, context)
		if context.before and context.main_eval and not context.blueprint and G.GAME.current_round.hands_played == 0 then
			local hit_cards = 0
			for i, scored_card in ipairs(context.scoring_hand) do

				if pseudorandom('j_joaf_jimbo_jpg') < G.GAME.probabilities.normal / card.ability.extra.odds then
					hit_cards = hit_cards + 1
					scored_card:set_ability('m_joaf_untextured', nil, true)
					G.E_MANAGER:add_event(Event({
						func = function()
							scored_card:juice_up()
							return true
						end
					}))
				end

			end
			if hit_cards > 0 then
				return {
					message = "Textures, begone!"
				}
			end
		end
	end
}