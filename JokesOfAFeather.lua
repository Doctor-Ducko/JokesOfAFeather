--[[
WELCOME TO THE PETRIFYING SOURCE CODE OF THIS MOD !!
====================================================
Please make sure to have a canister of bleach to your
immediate left and/or right incase of visual interaction
with programming based war crimes.
]]

local jokers = {
	"joker_qm",
	"jokerekoj",
	"binary_joker",
	"sunflower_joker",
	"dr_pepper",
	"straight_line",
	"misplaced",
	"jokr",
	"jramp",
	"photographer",
	"peter_griffin",
	"lois_griffin",
	"chris_griffin",
	"meg_griffin",
	"stewie_griffin",
	"brian_griffin",
	--"",
}

local enhancements = {
	"combo",
	"chipped"
}

local seals = {
	"pink",
	"green"
}

local spectral = {
	"multiply",
	"duplicate"
}

local trinket = {
	"test"
}

local decks = {
	"family",
	"chipped"
}

SMODS.Keybind {
	key = "Restart Game",
	key_pressed = "r",
	action = function(self)
		SMODS.restart_game()
	end,
	held_keys = {"lctrl"},
	event = "released"
}

SMODS.Atlas {
    key = "JOAFJokers",
    path = "DuckJokers.png",
	px = 71,
	py = 95
}
SMODS.Atlas {
    key = "JOAFDecks",
    path = "DuckDecks.png",
	px = 71,
	py = 95
}
SMODS.Atlas {
    key = "JOAFEnhance",
    path = "DuckEnhancements.png",
	px = 71,
	py = 95
}
SMODS.Atlas {
    key = "JOAFItems",
    path = "DuckItems.png",
	px = 71,
	py = 95
}

SMODS.ConsumableType {
	key = "Trinkets",
	collection_rows = {2, 2},
	primary_colour = HEX("FFFFFF"),
	secondary_colour = HEX("D66B1B"),
	loc_txt = {
		name = 'Trinket', -- used on card type badges
		collection = 'Trinket Cards', -- label for the button to access the collection
		undiscovered = { -- description for undiscovered cards in the collection
			name = 'Temp',
			text = { 'Temp' },
		},
	}
}

SMODS.Rarity({
	key = "family",
	loc_txt = {
		name = "Family Guy"
	},
	badge_colour = HEX("3b9c14"),
	default_weight = 0.003,
	pools = {
		["Joker"] = true
	},
})

--[[LOADING SECTION]]
for i,v in ipairs(jokers) do
	assert(SMODS.load_file("./src/jokers/" .. v .. ".lua"))()
end

for i,v in ipairs(enhancements) do
	assert(SMODS.load_file("./src/enhancements/" .. v .. ".lua"))()
end

for i,v in ipairs(seals) do
	assert(SMODS.load_file("./src/seals/" .. v .. ".lua"))()
end

for i,v in ipairs(spectral) do
	assert(SMODS.load_file("./src/consumables/spectral/" .. v .. ".lua"))()
end

for i,v in ipairs(trinket) do
	assert(SMODS.load_file("./src/consumables/trinket/" .. v .. ".lua"))()
end

for i,v in ipairs(decks) do
	assert(SMODS.load_file("./src/decks/" .. v .. ".lua"))()
end