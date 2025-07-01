SMODS.Joker {
	key = "freda",			-- Object ID, acessed with j_joaf_[key]
	atlas = "JOAFJokers",		-- Spritesheet to use, initalized in main script
	pos = {x = 7, y = 5},		-- works on a +1 increment, not based off of pixels
	rarity = "joaf_mostly_negative",					-- 1-Common | 2-Uncommon | 3-Rare | 4-Legendary, string id for modded rarities, found in main script
	cost = 9999999999999999999999999999999999999999999999999999999999990,					-- shop price
	pools = {
		["JOAFJokers"] = true
	},
	blueprint_compat = false,	-- Cosmetic only, define in calculate function
	eternal_compat = true,		-- Self Explanatory
	perishable_compat = true,

	unlocked = true,			-- Do not change these, they make the jokers visible on mod download
	discovered = false,

	-- Display text
	loc_txt = {
		name = "Freda",
		text = {
			"{C:red,E:1}Inverts{} your money if Blind",
			"is not beaten in {C:attention}1{} hand",
			"{C:green}#1# in #2#{} chance for your money to",
			"be set to {C:money}(Money ^ 10) * -1",
			"{C:inactive}(We'll KILL you if you don't play Infinity Kingdom(tm))"
		}
	},

	-- Variables used in loc_vars and calculate
	config = {
		extra = {
			odds = 25
		}
	},

	set_badges = function(self, card, badges)
		JOAF.credit_badge(card, badges, "kawabae")
		JOAF.reference_badge(card, badges, "scams")
	end,
	
	-- Variables to be used in the loc_txt area
	loc_vars = function(self, info_queue, card)
		info_queue[#info_queue+1] = { key = "common_sense", set = "Other" }
		return {
			vars = {
				G.GAME.probabilities.normal,
				card.ability.extra.odds
			}
		}
	end,

	-- look at wiki for info i aint writing it down here
	calculate = function(self, card, context)
		if context.end_of_round and context.cardarea == G.jokers and G.GAME.current_round.hands_played > 1 and not context.blueprint then
			if to_number(G.GAME.dollars) > 0 then
				if pseudorandom('j_joaf_freda') < G.GAME.probabilities.normal / card.ability.extra.odds then
					ease_dollars((G.GAME.dollars ^ 10) * -2) -- its times two since we have to subtract to get our amount
					return {
						message = "Super Fuck You.",
						colour = G.C.MONEY
					}
				else
					ease_dollars(G.GAME.dollars * -2) -- its times two since we have to subtract to get our amount
					return {
						message = "Fuck You.",
						colour = G.C.MONEY
					}
				end
			end
		end
	end
}