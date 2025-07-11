if JOAF.config.deltarune_spoilers then
	SMODS.Joker {
		key = "sword",			-- Object ID, acessed with j_joaf_[key]
		atlas = "JOAFJokers",		-- Spritesheet to use, initalized in main script
		pos = {x = 0, y = 5},		-- works on a +1 increment, not based off of pixels
		rarity = 2,					-- 1-Common | 2-Uncommon | 3-Rare | 4-Legendary, string id for modded rarities, found in main script
		cost = 8,					-- shop price
		pools = {
			["JOAFJokers"] = true
		},
		blueprint_compat = true,	-- Cosmetic only, define in calculate function
		eternal_compat = true,		-- Self Explanatory
		perishable_compat = true,

		unlocked = true,			-- Do not change these, they make the jokers visible on mod download
		discovered = false,

		-- Variables used in loc_vars and calculate
		config = {
			extra = {
				level = 1,
				exp = 0,
				to_next = 6,
				ability_value = 30, -- for staring +Mult
				exp_reqs = {
					6, -- lv1 to lv2
					15, -- lv2 to lv3
					25, -- lv3 to lv4
					0	-- lv4 to nowhere
				},
				ability_values = {
					30, -- lv1 +Mult
					3.5,  -- lv2 xMult
					8,  -- lv3 xMult
					2,  -- lv4 eMult
				}
			}
		},

		set_badges = function(self, card, badges)
			JOAF.reference_badge(card, badges, "deltarune")
		end,
		
		-- Variables to be used in the loc_txt area
		loc_vars = function(self, info_queue, card)
			local key = self.key
			key = key .. "_" .. tostring(card.ability.extra.level) or tostring(1)
			info_queue[#info_queue+1] = {key = "leveling_up", set = "Other"}
			return {
				key = key,
				vars = {
					self.display_lv(self, card),
					card.ability.extra.exp,
					card.ability.extra.to_next,
					card.ability.extra.ability_value,
					card.ability.extra.ability_values[card.ability.extra.level < 4 and card.ability.extra.level + 1 or 1]
				}
			}
		end,

		display_lv = function(self, card)
			if card.ability.extra.level == 4 then
				return "MAX"
			else
				return "LV" .. tostring(card.ability.extra.level)
			end
		end,

		exp_handler = function(self, card)
			-- prevent increasing beyond 4 (max)
			local val = 0
			if card.ability.extra.level == 4 then
				return "none", 0
			end

			-- increase exp
			if JOAF.is_showdown_blind(G.GAME.round_resets.blind.key) then
				card.ability.extra.exp = card.ability.extra.exp + 10
				val = 10
			elseif G.GAME.round_resets.blind.boss then
				card.ability.extra.exp = card.ability.extra.exp + 5
				val = 5
			elseif G.GAME.round_resets.blind.key == "bl_big" then -- i know this part kinda sucks but idk if theres a better way
				card.ability.extra.exp = card.ability.extra.exp + 2
				val = 2
			else
				card.ability.extra.exp = card.ability.extra.exp + 1
				val = 1
			end

			-- handle leveling up
			if card.ability.extra.exp >= card.ability.extra.to_next then
				card.ability.extra.exp = card.ability.extra.exp - card.ability.extra.to_next -- handle overflowing exp
				card.ability.extra.level = card.ability.extra.level + 1
				card.ability.extra.to_next = card.ability.extra.exp_reqs[card.ability.extra.level]
				card.ability.extra.ability_value = card.ability.extra.ability_values[card.ability.extra.level]
				
				if card.ability.extra.level == 4 then
					card.ability.extra.exp = 0
				end

				return "levelup", 0
			else
				return "exp", val
			end
		end,

		-- look at wiki for info i aint writing it down here
		calculate = function(self, card, context)
			if context.end_of_round and context.cardarea == G.jokers then
				local msg, value = self.exp_handler(self, card)
				if msg == "none" then
					return
				elseif msg == "exp" then
					return {
						message = "+" .. tostring(value)
					}
				elseif msg == "levelup" then
					return {
						message = "Level Up."
					}
				end
			end

			if context.joker_main then
				if card.ability.extra.level == 1 then
					return {
						mult = card.ability.extra.ability_value
					}
				elseif card.ability.extra.level == 2 or card.ability.extra.level == 3 then
					return {
						x_mult = card.ability.extra.ability_value
					}
				elseif card.ability.extra.level == 4 then
					return {
						e_mult = card.ability.extra.ability_value
					}
				end
			end
		end
	}
end