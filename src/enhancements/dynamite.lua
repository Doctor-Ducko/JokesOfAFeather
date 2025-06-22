SMODS.Enhancement{
    key = "dynamite",

	loc_txt = {
        name = "Dynamite Card",
        text ={
            "{X:mult,C:white}X#1#{} Mult",
			"Destroyed after {C:attention}#2#{} hands"
        },
	},

	atlas = 'JOAFEnhance',
	pos = {x = 5, y = 0},
	config = {
		x_mult = 2.5,
		turns_left = 3,
	},

	set_ability = function(self, card, initial, delay_sprites)
		card.dyna_turns = self.config.turns_left
	end,

	loc_vars = function(self, info_queue, card)
		return {
			vars = {
				self.config.x_mult,
				card.dyna_turns or 3,
			}
		}
	end,

	calculate = function(self, card, context)
		if context.final_scoring_step and context.cardarea == G.play then
			local long_fuse = SMODS.find_card("j_joaf_long_fuse")[1]
			if long_fuse and (pseudorandom('dyanmite_prevention_protocol') < G.GAME.probabilities.normal / long_fuse.ability.extra.odds) then
				return {
					message = "Safe!"
				}
			else
				card.dyna_turns = card.dyna_turns - 1
			end

			if card.dyna_turns == 0 then
				card.exploding = true
				G.E_MANAGER:add_event(Event({
					trigger = 'immediate',
					func = function() 
						card:start_dissolve()
						card:remove()
						return true
					end
				}))
			end
		end

 		if context.destroy_card and context.cardarea == G.play and context.destroy_card == card and card.exploding then
            return { remove = true }
        end
	end
}