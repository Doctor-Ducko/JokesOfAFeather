SMODS.Joker {
	key = "photographer",
	atlas = 'JOAFJokers',
	pos = { x = 1, y = 1 },
	rarity = 3,
	cost = 7,
	blueprint_compat = true,

	loc_txt = {
		name = "Photographer",
		text = {
			"Gains bonus chips",
			"according to {C:attention}half the base",
			"{C:attention}chip value of a scored card",
			"{C:inactive}(Currently {C:chips}+#1#{}{C:inactive} chips)",
			"{C:inactive}(Say... fuzzy pickles!)"
		}
	},

	set_badges = function(self, card, badges)
		JOAF.reference_badge(card, badges, "earthbound")
	end,

	config = {
		extra = {
			chips = 0,
		}
	},

	loc_vars = function(self, info_queue, card)
		return {
			vars = {
				card.ability.extra.chips
			}
		}
	end,

	calculate = function(self, card, context)
		if context.joker_main then
			return {
				chips = card.ability.extra.chips,
			}
		end
		if context.individual and context.cardarea == G.play then
			local bonus = context.other_card:get_id()

			-- someone please tell me there's a better way to do this, this sucks ass
			if bonus >= 11 and bonus <= 13 then
				bonus = 10
			elseif bonus == 14 then
				bonus = 11
			end

			if context.other_card.ability.effect == "Stone Card" then
				bonus = 50
			end

			bonus = math.ceil(bonus/2)

			card.ability.extra.chips = card.ability.extra.chips + bonus
			return {
				message = '+'..tostring(bonus),
				colour = G.C.CHIPS,
				card = card
			}
		end
	end
}