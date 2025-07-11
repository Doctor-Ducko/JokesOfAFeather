SMODS.Tag {
    key = "mini_coupon",
    atlas = "JOAFTags",
    pos = { x = 1, y = 1 },
    apply = function(self, tag, context)
        if context.type == 'shop_final_pass' and G.shop and not G.GAME.shop_free then
            G.GAME.shop_free = true
            tag:yep('+', G.C.GREEN, function()
                if G.shop_jokers then
                    for _, card in pairs(G.shop_jokers.cards) do
                        card.ability.couponed = true
                        card:set_cost()
                    end
                end
                return true
            end)
            tag.triggered = true
            return true
        end
    end
}