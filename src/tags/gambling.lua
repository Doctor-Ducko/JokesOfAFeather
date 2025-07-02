SMODS.Tag {
    key = "gambling",
    loc_txt = {
        name = "GAMBLING Tag",
        text = {
            "{C:green}#1# in 5{} chance for a random {C:legendary,E:1}Legendary",
            "{C:green}#1# in 15{} chance for an {C:joaf_mostly_negative,E:1}Eternal Freda",
            "{C:legendary,E:1}Legendary{} has priority over {C:joaf_mostly_negative,E:1}Freda{}"
        }
    },
    atlas = "JOAFTags",
    pos = { x = 3, y = 0},
    min_ante = 4,
    loc_vars = function(self, info_queue, tag)
        info_queue[#info_queue + 1] = G.P_CENTERS.j_joaf_freda
        return {
            vars = {
                G.GAME.probabilities.normal
            }
        }
    end,
    set_ability = function(self, tag)
        local card = {}
        if pseudorandom('tag_joaf_gambling_2') < G.GAME.probabilities.normal / 15 then
            card = {
                set = "Joker",
                key = "j_joaf_freda",
                stickers = {
                    "eternal"
                }
            }
        end
        if pseudorandom('tag_joaf_gambling_1') < G.GAME.probabilities.normal / 5 then
            card = {
                set = "Joker",
                rarity = "Legendary"
            }
        end
        tag.ability["card"] = card
    end,
    -- fank you vanilla remade
    apply = function(self, tag, context)
        if context.type == 'immediate' then
            local lock = tag.ID
            G.CONTROLLER.locks[lock] = true
            tag:yep('+', G.C.SECONDARY_SET.Joker, function()
                if tag.ability.card.key then
                    SMODS.add_card(tag.ability.card)
                end
                G.CONTROLLER.locks[lock] = nil
                return true
            end)
            tag.triggered = true
            return true
        end
    end
}