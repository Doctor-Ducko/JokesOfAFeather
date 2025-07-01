--[[
	Dear god this is gonna be a big one im actually scared

	update on june 30th

	fuck its still not done
]]
if JOAF.config.experimental_content then
	SMODS.Joker {
		key = "uno_cards",			-- Object ID, acessed with j_joaf_[key]
		atlas = "JOAFUNO",		-- Spritesheet to use, initalized in main script
		pos = {x = 0, y = 4},		-- works on a +1 increment, not based off of pixels
		rarity = 3,					-- 1-Common | 2-Uncommon | 3-Rare | 4-Legendary, string id for modded rarities, found in main script
		cost = 8,					-- shop price
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
			name = "Uno Cards",
			text = {
				"Pick a card from an {C:attention}UNO Deck{}",
				"and give effects based on",
				"the drawn card",
			}
		},

		-- Variables used in loc_vars and calculate
		config = {
			extra = {
				current_ability = 	{y = 4, x = 0, suit = "None",   rank = -1, ability = "none", value = 0, desc = "uno_inactive"},
				default = 			{y = 4, x = 0, suit = "None",   rank = -1, ability = "none", value = 0, desc = "uno_inactive"},
				data = {-- Xpos	  Ypos    Card Suit          Card ID    Effect        Value
				-- Red -> Hearts
					R_1 = {y = 0, x = 0 , suit = "Hearts",   rank = 14, ability = "x_mult", value = 2, desc = "uno_red_1"},
					R_2 = {y = 0, x = 1 , suit = "Hearts",   rank = 2,  ability = "x_mult", value = 2, desc = "uno_red_2"},
					R_3 = {y = 0, x = 2 , suit = "Hearts",   rank = 3,  ability = "x_mult", value = 2, desc = "uno_red_3"},
					R_4 = {y = 0, x = 3 , suit = "Hearts",   rank = 4,  ability = "x_mult", value = 2, desc = "uno_red_4"},
					R_5 = {y = 0, x = 4 , suit = "Hearts",   rank = 5,  ability = "x_mult", value = 2, desc = "uno_red_5"},
					R_6 = {y = 0, x = 5 , suit = "Hearts",   rank = 6,  ability = "x_mult", value = 2, desc = "uno_red_6"},
					R_7 = {y = 0, x = 6 , suit = "Hearts",   rank = 7,  ability = "x_mult", value = 2, desc = "uno_red_7"},
					R_8 = {y = 0, x = 7 , suit = "Hearts",   rank = 8,  ability = "x_mult", value = 2, desc = "uno_red_8"},
					R_9 = {y = 0, x = 8 , suit = "Hearts",   rank = 9,  ability = "x_mult", value = 2, desc = "uno_red_9"},
					R_0 = {y = 0, x = 9 , suit = "Hearts",   rank = 10, ability = "x_mult", value = 2, desc = "uno_red_0"},
					R_R = {y = 0, x = 10, suit = "Hearts",   rank = -1, ability = "suit_change", value = 0, desc = "uno_red_rev"}, -- Reverse
					R_S = {y = 0, x = 11, suit = "Hearts",   rank = -1, ability = "blind_req", value = 95, desc = "uno_red_skip"}, -- Skip
					R_D = {y = 0, x = 12, suit = "Hearts",   rank = -1, ability = "retrigger", value = 2, desc = "uno_red_draw"}, -- Draw +2

					-- Blue -> Clubs
					B_1 = {y = 1, x = 0 , suit = "Clubs",    rank = 14, ability = "mult", value = 35, desc = "uno_blue_1"},
					B_2 = {y = 1, x = 1 , suit = "Clubs",    rank = 2,  ability = "mult", value = 35, desc = "uno_blue_2"},
					B_3 = {y = 1, x = 2 , suit = "Clubs",    rank = 3,  ability = "mult", value = 35, desc = "uno_blue_3"},
					B_4 = {y = 1, x = 3 , suit = "Clubs",    rank = 4,  ability = "mult", value = 35, desc = "uno_blue_4"},
					B_5 = {y = 1, x = 4 , suit = "Clubs",    rank = 5,  ability = "mult", value = 35, desc = "uno_blue_5"},
					B_6 = {y = 1, x = 5 , suit = "Clubs",    rank = 6,  ability = "mult", value = 35, desc = "uno_blue_6"},
					B_7 = {y = 1, x = 6 , suit = "Clubs",    rank = 7,  ability = "mult", value = 35, desc = "uno_blue_7"},
					B_8 = {y = 1, x = 7 , suit = "Clubs",    rank = 8,  ability = "mult", value = 35, desc = "uno_blue_8"},
					B_9 = {y = 1, x = 8 , suit = "Clubs",    rank = 9,  ability = "mult", value = 35, desc = "uno_blue_9"},
					B_0 = {y = 1, x = 9 , suit = "Clubs",    rank = 10, ability = "mult", value = 35, desc = "uno_blue_0"},
					B_R = {y = 1, x = 10, suit = "Clubs",    rank = -1, ability = "suit_change", value = 0, desc = "uno_blue_rev"}, -- Reverse
					B_S = {y = 1, x = 11, suit = "Clubs",    rank = -1, ability = "blind_req", value = 95, desc = "uno_blue_skip"}, -- Skip
					B_D = {y = 1, x = 12, suit = "Clubs",    rank = -1, ability = "retrigger", value = 2, desc = "uno_blue_draw"}, -- Draw +2

					-- Yellow -> Diamonds
					Y_1 = {y = 2, x = 0 , suit = "Diamonds", rank = 14, ability = "dollars", value = 4, desc = "uno_yellow_1"},
					Y_2 = {y = 2, x = 1 , suit = "Diamonds", rank = 2,  ability = "dollars", value = 4, desc = "uno_yellow_2"},
					Y_3 = {y = 2, x = 2 , suit = "Diamonds", rank = 3,  ability = "dollars", value = 4, desc = "uno_yellow_3"},
					Y_4 = {y = 2, x = 3 , suit = "Diamonds", rank = 4,  ability = "dollars", value = 4, desc = "uno_yellow_4"},
					Y_5 = {y = 2, x = 4 , suit = "Diamonds", rank = 5,  ability = "dollars", value = 4, desc = "uno_yellow_5"},
					Y_6 = {y = 2, x = 5 , suit = "Diamonds", rank = 6,  ability = "dollars", value = 4, desc = "uno_yellow_6"},
					Y_7 = {y = 2, x = 6 , suit = "Diamonds", rank = 7,  ability = "dollars", value = 4, desc = "uno_yellow_7"},
					Y_8 = {y = 2, x = 7 , suit = "Diamonds", rank = 8,  ability = "dollars", value = 4, desc = "uno_yellow_8"},
					Y_9 = {y = 2, x = 8 , suit = "Diamonds", rank = 9,  ability = "dollars", value = 4, desc = "uno_yellow_9"},
					Y_0 = {y = 2, x = 9 , suit = "Diamonds", rank = 10, ability = "dollars", value = 4, desc = "uno_yellow_0"},
					Y_R = {y = 2, x = 10, suit = "Diamonds", rank = -1, ability = "suit_change", value = 0, desc = "uno_yellow_rev"}, -- Reverse
					Y_S = {y = 2, x = 11, suit = "Diamonds", rank = -1, ability = "blind_req", value = 95, desc = "uno_yellow_skip"}, -- Skip
					Y_D = {y = 2, x = 12, suit = "Diamonds", rank = -1, ability = "retrigger", value = 2, desc = "uno_yellow_draw"}, -- Draw +2

					-- Green -> Spades
					G_1 = {y = 3, x = 0,  suit = "Spades",   rank = 14, ability = "chips", value = 150, desc = "uno_green_1"},
					G_2 = {y = 3, x = 1,  suit = "Spades",   rank = 2,  ability = "chips", value = 150, desc = "uno_green_2"},
					G_3 = {y = 3, x = 2,  suit = "Spades",   rank = 3,  ability = "chips", value = 150, desc = "uno_green_3"},
					G_4 = {y = 3, x = 3,  suit = "Spades",   rank = 4,  ability = "chips", value = 150, desc = "uno_green_4"},
					G_5 = {y = 3, x = 4,  suit = "Spades",   rank = 5,  ability = "chips", value = 150, desc = "uno_green_5"},
					G_6 = {y = 3, x = 5,  suit = "Spades",   rank = 6,  ability = "chips", value = 150, desc = "uno_green_6"},
					G_7 = {y = 3, x = 6,  suit = "Spades",   rank = 7,  ability = "chips", value = 150, desc = "uno_green_7"},
					G_8 = {y = 3, x = 7,  suit = "Spades",   rank = 8,  ability = "chips", value = 150, desc = "uno_green_8"},
					G_9 = {y = 3, x = 8,  suit = "Spades",   rank = 9,  ability = "chips", value = 150, desc = "uno_green_9"},
					G_0 = {y = 3, x = 9,  suit = "Spades",   rank = 10, ability = "chips", value = 150, desc = "uno_green_0"},
					G_R = {y = 3, x = 10, suit = "Spades",   rank = -1, ability = "suit_change", value = 0, desc = "uno_green_rev"}, -- Reverse
					G_S = {y = 3, x = 11, suit = "Spades",   rank = -1, ability = "blind_req", value = 95, desc = "uno_green_skip"}, -- Skip
					G_D = {y = 3, x = 12, suit = "Spades",   rank = -1, ability = "retrigger", value = 2, desc = "uno_green_draw"}, -- Draw +2
				}
			}
		},
		-- Variables to be used in the loc_txt area
		loc_vars = function(self, info_queue, card)
			local tbl = card.ability.extra.current_ability
			info_queue[#info_queue+1] = {
				key = tbl.desc or "uno_missing",
				set = 'Other',
				vars = {
					tbl.rank,
					tbl.suit,
					tbl.value,
					colours = { G.C.SUITS[tbl.suit] }
				},
			}
		end,

		set_badges = function(self, card, badges)
			JOAF.indev_badge(badges)
		end,

		remove_from_deck = function(self, card, from_debuff)
			JOAF.change_sprite(card, card.ability.extra.default.x, card.ability.extra.default.y)
		end,
		
		-- look at wiki for info i aint writing it down here
		calculate = function(self, card, context)
			
			-- Resets the Sprite
			if context.end_of_round and context.cardarea == G.jokers then
				card.ability.extra.current_ability = card.ability.extra.default
				JOAF.change_sprite(card, card.ability.extra.current_ability.x, card.ability.extra.current_ability.y)
			end
			
			-- Sets up the ability stuff
			if context.setting_blind then
				card.ability.extra.current_ability = pseudorandom_element(card.ability.extra.data, "j_joaf_uno_cards")
				--card.ability.extra.current_ability = card.ability.extra.data.Y_R
				JOAF.change_sprite(card, card.ability.extra.current_ability.x, card.ability.extra.current_ability.y)
			end
			
			-- Suit change
			if context.before and context.main_eval and not context.blueprint and card.ability.extra.current_ability.ability == "suit_change" then
				local ability = card.ability.extra.current_ability
				for i, card in ipairs(context.scoring_hand) do
					if not context.other_card:is_suit(ability.suit) then
						assert(SMODS.change_base(card, ability.suit))
					end
				end
			end
			-- Most effects are scored here
			if context.individual and context.cardarea == G.play then
				local ability = card.ability.extra.current_ability

				if ability.ability ~= "retrigger" or ability.ability ~= "suit_change" then
					if context.other_card:is_suit(ability.suit) then

						-- Skip cards lowering blind requirement
						if ability.ability == "blind_req" then
							JOAF.change_blind_requirement(ability.value)
							return {
								message = "Lowered!"
							}
						end

						-- Used for basic Rank+Suit scoring effects
						if context.other_card:get_id() == ability.rank then
							local return_table = {}
							return_table[ability.ability] = ability.value
							return return_table
						end
					end
				end

				-- Repetitions
				if context.cardarea == G.play and context.repetition and not context.repetition_only then
					local ability = card.ability.extra.current_ability
					if context.other_card:is_suit(ability.suit) and ability.ability == "retrigger" then
						return {
							message = 'Again!',
							repetitions = ability.value,
							card = context.other_card
						}
					end
				end

			end
		end,
	}
end