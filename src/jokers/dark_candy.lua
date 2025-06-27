SMODS.Joker {
	key = "dark_candy",			-- Object ID, acessed with j_joaf_[key]
	atlas = "JOAFJokers",		-- Spritesheet to use, initalized in main script
	pos = {x = 7, y = 4},		-- works on a +1 increment, not based off of pixels
	rarity = 1,					-- 1-Common | 2-Uncommon | 3-Rare | 4-Legendary, string id for modded rarities, found in main script
	cost = 3,					-- shop price
	pools = {
		["Food"] = true
	},
	blueprint_compat = true,	-- Cosmetic only, define in calculate function
	eternal_compat = true,		-- Self Explanatory
	perishable_compat = true,

	unlocked = true,			-- Do not change these, they make the jokers visible on mod download
	discovered = false,

	-- Display text
	loc_txt = {
		name = "Dark Candy",
		text = {
			"{C:chips}+#1#{} chips",
			"{C:attention}Evolves{} after {C:attention}#2# {C:inactive}(#3#){} rounds"
		}
	},

	set_badges = function(self, card, badges)
		JOAF.reference_badge(card, badges, "deltarune")
	end,

	-- Variables used in loc_vars and calculate
	config = {
		extra = {
			chips = 40,
			rounds_to_evo = 4,
			rounds_left = 4
		}
	},
	-- Variables to be used in the loc_txt area

	loc_vars = function(self, info_queue, card)
		return { vars = {
			card.ability.extra.chips,
			card.ability.extra.rounds_to_evo,
			card.ability.extra.rounds_left,
		}}
	end,

	-- look at wiki for info i aint writing it down here
	calculate = function(self, card, context)
		if context.joker_main then
			return {
				chips = card.ability.extra.chips -- +40
			}
		end
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
			SMODS.add_card(
				{
					set = "Joker",
					key = "j_joaf_darker_candy"
				}
			)
		end
	end
}