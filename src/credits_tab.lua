JOAF.extra_tabs = function()
	return {
		{
			label = 'Credits',
			tab_definition_function = function()
				return {
                    n = G.UIT.ROOT, config = {r = 0.1, minw = 1, minh = 1, align = "cm", padding = 0.2, colour = G.C.BLACK},
                    nodes = {
                        {
                            n = G.UIT.C, config = {align = "cm", minw = 1, minh = 1},
                            nodes = {
                                {n = G.UIT.R, config = {align = "cm", minw = 1, minh = 1},
                                    nodes = {
                                        {n = G.UIT.T, config = {text = "Doctor Ducko - Programmer, Artist", colour = JOAF.dev_table.doctor_ducko[2], scale = 0.6, shadow = true}},
                                    }
                                },
                                {n = G.UIT.R, config = {align = "cm", minw = 1, minh = 1},
                                    nodes = {
                                        {n = G.UIT.T, config = {text = "Chilli - Ideas", colour = JOAF.dev_table.chilli[2], scale = 0.6, shadow = true}},
                                    }
                                },
                                {n = G.UIT.R, config = {align = "cm", minw = 1, minh = 1},
                                    nodes = {
                                        {n = G.UIT.T, config = {text = "AltF4 - Ideas", colour = JOAF.dev_table.altf4[2], scale = 0.6, shadow = true}},
                                    }
                                },
                                {n = G.UIT.R, config = {align = "cm", minw = 1, minh = 1},
                                    nodes = {
                                        {n = G.UIT.T, config = {text = "Kawabae - Ideas", colour = JOAF.dev_table.kawabae[2], scale = 0.6, shadow = true}},
                                    }
                                },
                                {n = G.UIT.R, config = {align = "cm", minw = 1, minh = 1},
                                    nodes = {
                                        {n = G.UIT.T, config = {text = "Various Public Resources - Example Code", colour = G.C.WHITE, scale = 0.6, shadow = true}},
                                    }
                                },
                            }
                        }
				    }
                }
			end,
		},
	}
end