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
		turns_left = 1,
	},

	set_ability = function(self, card, initial, delay_sprites)
		card.dyna_turns = self.config.turns_left
	end,

	loc_vars = function(self, info_queue, card)
		return {
			vars = {
				self.config.x_mult,
				card.dyna_turns,
			}
		}
	end,

	calculate = function(self, card, context)
		if context.final_scoring_step and context.cardarea == G.play then
			card.dyna_turns = card.dyna_turns - 1
			if card.dyna_turns == 0 then
				G.E_MANAGER:add_event(Event({
					trigger = 'after',
					delay = 0.2,
					func = function() 
						card:remove()
						--card:start_dissolve()
					return true
				end }))
			end
		end
	end
}