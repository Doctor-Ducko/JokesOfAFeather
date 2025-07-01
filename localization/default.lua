return {
    descriptions = {
        Sleeve = {
            sleeve_joaf_family = {
                name = "Family Sleeve",
                text = {
                    "{C:joaf_family}Family Guy {C:attention}Jokers{} are",
                    "{C:attention}#1#X{} more likely to appear"
                }
            },
            sleeve_joaf_family_alt = {
                name = "Family Sleeve",
                text = {
                    "{C:joaf_family}Family Guy {C:attention}Jokers{} are",
                    "another {C:attention}#1#X{} more likely to appear",
                    "{C:inactive}(Total: {C:attention}#2#X{C:inactive})"
                }
            },
            sleeve_joaf_iconic = {
                name = "Iconic Sleeve",
                text = {
                    "Start with a random",
			        "{C:legendary,E:1}Legendary {C:attention}J.O.A.F. Joker"
                }
            },
            sleeve_joaf_iconic_alt = {
                name = "Iconic Sleeve",
                text = {
                    "Start with another random",
			        "{C:legendary,E:1}Legendary {C:attention}J.O.A.F. Joker",
                    "{C:inactive}(Duplicates can appear)"
                }
            },
            sleeve_joaf_hikers = {
                name = "Hiker's Sleeve",
                text = {
                    "Start with {C:attention,T:v_overstock_norm}Overstock{}, {C:attention,T:v_seed_money}Seed Money{},",
                    "and {C:attention,T:v_paint_brush}Paint Brush{}.",
                    "{C:attention}+#1#{} Joker slot, {C:blue}+#2#{} hand, {C:red}+#3#{} discard.",
                    "Winning Ante is {C:attention}#4#{}",
                }
            },
            sleeve_joaf_hikers_alt = {
                name = "Hiker's Sleeve",
                text = {
                    "Start with {C:attention,T:v_overstock_plus}Overstock Plus{}, {C:attention,T:v_money_tree}Money Tree{},",
                    "{C:attention,T:v_palette}Palette{} and {C:attention,T:v_directors_cut}Director's Cut{}.",
                    "{C:attention}+#1#{} Joker slots, {C:blue}+#2#{} hands, {C:red}+#3#{} discards.",
                    "Winning Ante is {C:attention}#4#{}",
                }
            }
        },
        Other = {
            factorial = {
                name = "Factorial",
                text = {
                    "Example:",
			        "5! = 5 * 4 * 3 * 2 * 1",
                }
            },
            common_sense = {
                name = "Notice",
                text = {
                    "Don't go out of your",
                    "way to harass this",
                    "person, {C:red}this is mean enough"
                }
            },
            -- 1 is rank
            -- 2 is suit
            -- 3 is value
            uno_missing = {
                name = "MISSING",
                text = {
                    "oops something went wrong"
                }
            },
            uno_inactive = {
                name = "Inactive",
                text = {
                    "No card drawn"
                }
            },

            uno_red_0 = {
                name = "Red 0",
                text = {
                    "{C:attention}#1#s{} of {V:1}#2#{}",
                    "score {X:mult,C:white}X#3#{} Mult"
                },
            },
            uno_red_1 = {
                name = "Red 1",
                text = {
                    "{C:attention}Aces{} of {V:1}#2#{}",
                    "score {X:mult,C:white}X#3#{} Mult"
                },
            },
            uno_red_2 = {
                name = "Red 2",
                text = {
                    "{C:attention}#1#s{} of {V:1}#2#{}",
                    "score {X:mult,C:white}X#3#{} Mult"
                },
            },
            uno_red_3 = {
                name = "Red 3",
                text = {
                    "{C:attention}#1#s{} of {V:1}#2#{}",
                    "score {X:mult,C:white}X#3#{} Mult"
                },
            },
            uno_red_4 = {
                name = "Red 4",
                text = {
                    "{C:attention}#1#s{} of {V:1}#2#{}",
                    "score {X:mult,C:white}X#3#{} Mult"
                },
            },
            uno_red_5 = {
                name = "Red 5",
                text = {
                    "{C:attention}#1#s{} of {V:1}#2#{}",
                    "score {X:mult,C:white}X#3#{} Mult"
                },
            },
            uno_red_6 = {
                name = "Red 6",
                text = {
                    "{C:attention}#1#s{} of {V:1}#2#{}",
                    "score {X:mult,C:white}X#3#{} Mult"
                },
            },
            uno_red_7 = {
                name = "Red 7",
                text = {
                    "{C:attention}#1#s{} of {V:1}#2#{}",
                    "score {X:mult,C:white}X#3#{} Mult"
                },
            },
            uno_red_8 = {
                name = "Red 8",
                text = {
                    "{C:attention}#1#s{} of {V:1}#2#{}",
                    "score {X:mult,C:white}X#3#{} Mult"
                },
            },
            uno_red_9 = {
                name = "Red 9",
                text = {
                    "{C:attention}#1#s{} of {V:1}#2#{}",
                    "score {X:mult,C:white}X#3#{} Mult"
                },
            },
            uno_red_rev = {
                name = "Red Reverse",
                text = {
                    "Non-{V:1}#2#{} are converted to",
                    "{V:1}#2#{} when scored"
                }
            },
            uno_red_skip = {
                name = "Red Skip",
                text = {
                    "{V:1}#2#{} lower {C:attention}Blind Requirement{}",
                    "to {C:attention}#3#%{} when scored"
                }
            },
            uno_red_draw = {
                name = "Red Draw 2",
                text = {
                    "{V:1}#2#{} are {C:attention}retriggered",
                    "{C:attention}#3#{} times"
                }
            },

            uno_blue_0 = {
                name = "Blue 0",
                text = {
                    "{C:attention}#1#s{} of {V:1}#2#{}",
                    "score {C:mult}+#3#{} Mult"
                },
            },
            uno_blue_1 = {
                name = "Blue 1",
                text = {
                    "{C:attention}Aces{} of {V:1}#2#{}",
                    "score {C:mult}+#3#{} Mult"
                },
            },
            uno_blue_2 = {
                name = "Blue 2",
                text = {
                    "{C:attention}#1#s{} of {V:1}#2#{}",
                    "score {C:mult}+#3#{} Mult"
                },
            },
            uno_blue_3 = {
                name = "Blue 3",
                text = {
                    "{C:attention}#1#s{} of {V:1}#2#{}",
                    "score {C:mult}+#3#{} Mult"
                },
            },
            uno_blue_4 = {
                name = "Blue 4",
                text = {
                    "{C:attention}#1#s{} of {V:1}#2#{}",
                    "score {C:mult}+#3#{} Mult"
                },
            },
            uno_blue_5 = {
                name = "Blue 5",
                text = {
                    "{C:attention}#1#s{} of {V:1}#2#{}",
                    "score {C:mult}+#3#{} Mult"
                },
            },
            uno_blue_6 = {
                name = "Blue 6",
                text = {
                    "{C:attention}#1#s{} of {V:1}#2#{}",
                    "score {C:mult}+#3#{} Mult"
                },
            },
            uno_blue_7 = {
                name = "Blue 7",
                text = {
                    "{C:attention}#1#s{} of {V:1}#2#{}",
                    "score {C:mult}+#3#{} Mult"
                },
            },
            uno_blue_8 = {
                name = "Blue 8",
                text = {
                    "{C:attention}#1#s{} of {V:1}#2#{}",
                    "score {C:mult}+#3#{} Mult"
                },
            },
            uno_blue_9 = {
                name = "Blue 9",
                text = {
                    "{C:attention}#1#s{} of {V:1}#2#{}",
                    "score {C:mult}+#3#{} Mult"
                },
            },
            uno_blue_rev = {
                name = "Blue Reverse",
                text = {
                    "Non-{V:1}#2#{} are converted to",
                    "{V:1}#2#{} when scored"
                }
            },
            uno_blue_skip = {
                name = "Blue Skip",
                text = {
                    "{V:1}#2#{} lower {C:attention}Blind Requirement{}",
                    "to {C:attention}#3#%{} when scored"
                }
            },
            uno_blue_draw = {
                name = "Blue Draw 2",
                text = {
                    "{V:1}#2#{} are {C:attention}retriggered",
                    "{C:attention}#3#{} times"
                }
            },

            uno_yellow_0 = {
                name = "Yellow 0",
                text = {
                    "{C:attention}#1#s{} of {V:1}#2#{}",
                    "score {C:money}$#3#{}"
                },
            },
            uno_yellow_1 = {
                name = "Yellow 1",
                text = {
                    "{C:attention}Aces{} of {V:1}#2#{}",
                    "score {C:money}$#3#{}"
                },
            },
            uno_yellow_2 = {
                name = "Yellow 2",
                text = {
                    "{C:attention}#1#s{} of {V:1}#2#{}",
                    "score {C:money}$#3#{}"
                },
            },
            uno_yellow_3 = {
                name = "Yellow 3",
                text = {
                    "{C:attention}#1#s{} of {V:1}#2#{}",
                    "score {C:money}$#3#{}"
                },
            },
            uno_yellow_4 = {
                name = "Yellow 4",
                text = {
                    "{C:attention}#1#s{} of {V:1}#2#{}",
                    "score {C:money}$#3#{}"
                },
            },
            uno_yellow_5 = {
                name = "Yellow 5",
                text = {
                    "{C:attention}#1#s{} of {V:1}#2#{}",
                    "score {C:money}$#3#{}"
                },
            },
            uno_yellow_6 = {
                name = "Yellow 6",
                text = {
                    "{C:attention}#1#s{} of {V:1}#2#{}",
                    "score {C:money}$#3#{}"
                },
            },
            uno_yellow_7 = {
                name = "Yellow 7",
                text = {
                    "{C:attention}#1#s{} of {V:1}#2#{}",
                    "score {C:money}$#3#{}"
                },
            },
            uno_yellow_8 = {
                name = "Yellow 8",
                text = {
                    "{C:attention}#1#s{} of {V:1}#2#{}",
                    "score {C:money}$#3#{}"
                },
            },
            uno_yellow_9 = {
                name = "Yellow 9",
                text = {
                    "{C:attention}#1#s{} of {V:1}#2#{}",
                    "score {C:money}$#3#{}"
                },
            },
            uno_yellow_rev = {
                name = "Yellow Reverse",
                text = {
                    "Non-{V:1}#2#{} are converted to",
                    "{V:1}#2#{} when scored"
                }
            },
            uno_yellow_skip = {
                name = "Yellow Skip",
                text = {
                    "{V:1}#2#{} lower {C:attention}Blind Requirement{}",
                    "to {C:attention}#3#%{} when scored"
                }
            },
            uno_yellow_draw = {
                name = "Yellow Draw 2",
                text = {
                    "{V:1}#2#{} are {C:attention}retriggered",
                    "{C:attention}#3#{} times"
                }
            },
    
            uno_green_0 = {
                name = "Green 0",
                text = {
                    "{C:attention}#1#s{} of {V:1}#2#{}",
                    "score {C:chips}+#3#{} Chips"
                },
            },
            uno_green_1 = {
                name = "Green 1",
                text = {
                    "{C:attention}Aces{} of {V:1}#2#{}",
                    "score {C:chips}+#3#{} Chips"
                },
            },
            uno_green_2 = {
                name = "Green 2",
                text = {
                    "{C:attention}#1#s{} of {V:1}#2#{}",
                    "score {C:chips}+#3#{} Chips"
                },
            },
            uno_green_3 = {
                name = "Green 3",
                text = {
                    "{C:attention}#1#s{} of {V:1}#2#{}",
                    "score {C:chips}+#3#{} Chips"
                },
            },
            uno_green_4 = {
                name = "Green 4",
                text = {
                    "{C:attention}#1#s{} of {V:1}#2#{}",
                    "score {C:chips}+#3#{} Chips"
                },
            },
            uno_green_5 = {
                name = "Green 5",
                text = {
                    "{C:attention}#1#s{} of {V:1}#2#{}",
                    "score {C:chips}+#3#{} Chips"
                },
            },
            uno_green_6 = {
                name = "Green 6",
                text = {
                    "{C:attention}#1#s{} of {V:1}#2#{}",
                    "score {C:chips}+#3#{} Chips"
                },
            },
            uno_green_7 = {
                name = "Green 7",
                text = {
                    "{C:attention}#1#s{} of {V:1}#2#{}",
                    "score {C:chips}+#3#{} Chips"
                },
            },
            uno_green_8 = {
                name = "Green 8",
                text = {
                    "{C:attention}#1#s{} of {V:1}#2#{}",
                    "score {C:chips}+#3#{} Chips"
                },
            },
            uno_green_9 = {
                name = "Green 9",
                text = {
                    "{C:attention}#1#s{} of {V:1}#2#{}",
                    "score {C:chips}+#3#{} Chips"
                },
            },
            uno_green_rev = {
                name = "Green Reverse",
                text = {
                    "Non-{V:1}#2#{} are converted to",
                    "{V:1}#2#{} when scored"
                }
            },
            uno_green_skip = {
                name = "Green Skip",
                text = {
                    "{V:1}#2#{} lower {C:attention}Blind Requirement{}",
                    "to {C:attention}#3#%{} when scored"
                }
            },
            uno_green_draw = {
                name = "Green Draw 2",
                text = {
                    "{V:1}#2#{} are {C:attention}retriggered",
                    "{C:attention}#3#{} times"
                }
            },
        }
    }
}