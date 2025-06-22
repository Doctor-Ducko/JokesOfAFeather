JOAF.config_tab = function()

    -- Sets up the base part of the config menu and adds the nodes made above
    return {
        n = G.UIT.ROOT,
        config = {
            emboss = 0.05,
            minh = 3,
            r = 0.1,
            minw = 10,
            align = "cm",
            padding = 0.2,
            colour = G.C.BLACK
        },
        nodes = {
            {n=G.UIT.R, config={align = "tm"}, nodes={
                {n=G.UIT.O, config={object = DynaText({string = "(Reload game to apply changes)", colours = {G.C.WHITE}, shadow = true, scale = 0.4})}},
            }},
            create_toggle({
                label = "Enable Experimental Content:",
                info = {"Used for unfinished/buggy content"},
                ref_table = JOAF.config,
                ref_value = "experimental_content"
            }),
        }
    }
end