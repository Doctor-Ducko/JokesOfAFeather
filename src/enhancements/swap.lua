SMODS.Enhancement{
    key = "swap",

	loc_txt = {
        name = "Swap Card",
        text ={
            "Swap {C:chips}chips{} and {C:mult}Mult{}"
        },
	},

	atlas = 'JOAFEnhance',
	pos = {x = 7, y = 0},
	config = {},

    calculate = function(self, card, context)
        if context.cardarea == G.play and context.main_scoring then
            return {
                swap = true
            }
        end
    end
}
