CardSleeves.Sleeve {
    key = "_template",
    atlas = "JOAFSleeves",
    pos = {x = 0, y = 0},
	loc_vars = function(self)
        local key, vars
        if self.get_current_deck_key() == "b_joaf_deck_key" then
            key = self.key .. "_alt"
            self.config = {

            }
            vars = {

            }
        else
            key = self.key
            self.config = {

            }
            vars = {

            }
        end
        return { key = key, vars = vars }
    end,
}