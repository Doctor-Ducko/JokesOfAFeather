--[[
WELCOME TO THE PETRIFYING SOURCE CODE OF THIS MOD !!
====================================================
Please make sure to have a canister of bleach to your
immediate left and/or right incase of visual interaction
with programming based war crimes.
]]

JOAF = SMODS.current_mod

JOAF.load_jokers = {
	"joker_qm",
	"jokerekoj",
	"binary_joker",
	"simple_joker",
	"sunflower_joker",
	"tinkerer_joker",
	"joker_face",
	"dr_pepper",
	"straight_line",
	"misplaced",
	"mia_joker",
	"picture_frame",
	"jokr",
	"jramp",
	"photographer",
	"evil_joker",
	"peter_griffin",
	"lois_griffin",
	"chris_griffin",
	"meg_griffin",
	"stewie_griffin",
	"brian_griffin",
	--"",
}

JOAF.load_enhancements = {
	"combo",
	"chipped",
}

JOAF.load_seals = {
	"pink",
	"green",
}

JOAF.load_spectrals = {
	"multiply",
	"duplicate",
}

JOAF.load_trinkets = {
	"trash_bag",
	"gloves",
	"potato_chips",
	"math_book",
	"golden_ring",
}

JOAF.load_decks = {
	"family",
	"starlight",
}

JOAF.load_vouchers = {
	"trinket_merchant"
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

SMODS.Atlas({
    key = "modicon",
    path = "icon.png",
    px = 34,
    py = 34
  })

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
SMODS.Atlas {
    key = "JOAFVouchers",
    path = "DuckVouchers.png",
	px = 71,
	py = 95
}

SMODS.ConsumableType {
	key = "Trinkets",
	collection_rows = {5, 3},
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
	key = "family",					-- ID, indexed with joaf_[key]
	loc_txt = {
		name = "Family Guy"
	},
	badge_colour = HEX("3b9c14"),	-- Color of the badge
	default_weight = 0.01,			-- Percent chance to find in shops [Common, 0.7 | Uncommon, 0.25 | Rare, 0.5]
	pools = {
		["Joker"] = true
	},
})

--[[LOADING SECTION]]
assert(SMODS.load_file("./src/duck_globals.lua"))()

for i,v in ipairs(JOAF.load_jokers) do
	assert(SMODS.load_file("./src/jokers/" .. v .. ".lua"))()
end

for i,v in ipairs(JOAF.load_enhancements) do
	assert(SMODS.load_file("./src/enhancements/" .. v .. ".lua"))()
end

for i,v in ipairs(JOAF.load_seals) do
	assert(SMODS.load_file("./src/seals/" .. v .. ".lua"))()
end

for i,v in ipairs(JOAF.load_spectrals) do
	assert(SMODS.load_file("./src/consumables/spectral/" .. v .. ".lua"))()
end

for i,v in ipairs(JOAF.load_trinkets) do
	assert(SMODS.load_file("./src/consumables/trinket/" .. v .. ".lua"))()
end

for i,v in ipairs(JOAF.load_decks) do
	assert(SMODS.load_file("./src/decks/" .. v .. ".lua"))()
end

for i,v in ipairs(JOAF.load_vouchers) do
	assert(SMODS.load_file("./src/vouchers/" .. v .. ".lua"))()
end