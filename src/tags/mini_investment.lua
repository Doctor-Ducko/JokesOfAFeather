SMODS.Tag {
    key = "mini_investment",
    atlas = "JOAFTags",
    pos = { x = 0, y = 1 },
    config = { dollars = 10 },
    loc_vars = function(self, info_queue, tag)
        return { vars = { tag.config.dollars } }
    end,
    apply = function(self, tag, context)
        if context.type == 'eval' then
            if G.GAME.last_blind and G.GAME.last_blind.boss then
                tag:yep('+', G.C.GOLD, function()
                    return true
                end)
                tag.triggered = true
                return {
                    dollars = tag.config.dollars,
                    condition = localize('ph_defeat_the_boss'),
                    atlas = "JOAFTags",
                    pos = tag.pos,
                    tag = tag
                }
            end
        end
    end
}