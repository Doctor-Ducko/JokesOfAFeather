--[[
WELCOME TO THE PETRIFYING SOURCE CODE OF THIS MOD !!
====================================================
Please make sure to have a canister of bleach to your
immediate left and/or right incase of visual interaction
with programming based war crimes.
]]

--[[VARIABLE INITS]]--
SMODS = SMODS
G = G
JOAF = SMODS.current_mod

--[[COMPATABILITY VARS]]--
JOAF.has_talisman 		= next(SMODS.find_mod("Talisman"))
JOAF.has_cryptid 		= next(SMODS.find_mod("Cryptid"))
JOAF.has_cardsleeves 	= next(SMODS.find_mod("CardSleeves"))

--[[LOAD LISTS]]--
JOAF.load_jokers = {
	-- Common
	"joker_qm",
	"jokerekoj",
	"binary_joker",
	"sunflower_joker",
	"recycling_bin",
	"simple_joker",
	"picture_frame",
	"misplaced",
	"abundant_joker",

	-- Uncommon
	"tinkerer_joker",
	"jokr",
	"lil_joker",
	"joker_face",
	"jimbo_jpg",
	"irritating_joker",
	"dr_pepper",
	"straight_line",
	"slot_machine",
	"mia_joker",
	"novel_joker",

	-- Rare
	"comedian",
	"jramp",
	"joker_energy",
	"photographer",
	"evil_joker",
	"precious_joker",

	-- Legendary
	"emperor",
	"money_smart",
	"flug",

	-- Family Guy
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
	"stained",
	"dynamite",
}

JOAF.load_seals = {
	"pink",
}

JOAF.load_spectrals = {
	"multiply",
}

JOAF.load_trinkets = {
	"trash_bag",
	"gloves",
	"wallet",
	"potato_chips",
	"math_book",
	"golden_ring",
}

JOAF.load_decks = {
	"family",
	"starlight",
	"tinkerers",
	"hikers",
}

JOAF.load_vouchers = {
	"trinket_merchant",
	"trinket_tycoon",
}

JOAF.load_boosters = {
	"trinket_normal_1",
	"trinket_normal_2",
	"trinket_jumbo_1",
	"trinket_mega_1",
}

JOAF.load_sleeves = {
	-- Again, just planned
}

--[[KEYBINDS]]--
SMODS.Keybind {
	key = "Restart Game",
	key_pressed = "r",
	action = function(self)
		SMODS.restart_game()
	end,
	held_keys = {"lalt"},
	event = "released"
}

--[[ATLASES]]--
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
SMODS.Atlas {
    key = "JOAFBoosters",
    path = "DuckBoosters.png",
	px = 71,
	py = 95
}

--[[SOUNDS]]--
if not JOAF.has_talisman then
	SMODS.Sound({
		key = "echip",
		path = "ExponentialChips.wav"
	})

	SMODS.Sound({
		key = "emult",
		path = "ExponentialMult.wav"
	})
end

--[[CONSUMABLES & RARITIES]]--
SMODS.ConsumableType {
	key = "Trinkets",
	collection_rows = {5, 3},
	primary_colour = HEX("FFFFFF"),
	secondary_colour = HEX("D66B1B"),
	shop_rate = 2,
	loc_txt = {
		name = 'Trinket', -- used on card type badges
		collection = 'Trinket Cards', -- label for the button to access the collection
	},
}

SMODS.Rarity({
	key = "family",					-- ID, indexed with joaf_[key]
	loc_txt = {
		name = "Family Guy"
	},
	badge_colour = HEX("3b9c14"),	-- Color of the badge
	default_weight = 0.01,			-- Percent chance to find in shops [Common, 0.7 | Uncommon, 0.25 | Rare, 0.05]
	pools = {
		["Joker"] = true
	},
})

--[[LOADING SECTION]]--
assert(SMODS.load_file("./src/duck_globals.lua"))()
assert(SMODS.load_file("./src/config_tab.lua"))()

if not JOAF.has_talisman then
	assert(SMODS.load_file("./src/exponent_stuff.lua"))()
end

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

for i,v in ipairs(JOAF.load_boosters) do
	assert(SMODS.load_file("./src/boosters/" .. v .. ".lua"))()
end


-- secret !!
if JOAF.has_cryptid then
	SMODS.Joker {
		key = 'catastrophic_joker',
		atlas = 'JOAFJokers',
		pos = { x = 0, y = 0 }, -- works on a +1 increment, not based off of pixels
		rarity = 3, -- 1: common, 2: uncommon, 3: rare, 4: legendary
		cost = 3,
		blueprint_compat = true,

		loc_txt = {
			name = 'Catastrophic Joker',
			text = {
				"{X:dark_edition,C:white,s:2}^^^^^#1#{} Mult",
				"{C:inactive,s:0.9}(A Cryptid Exclusive!)"
			}
		},

		config = {
			extra = {
				hyper_mult = {5,2}
			}
		},

		loc_vars = function(self, info_queue, card)
			return {
				vars = {
					card.ability.extra.hyper_mult[2]
				}
			}
		end,

		calculate = function(self, card, context)
			if context.joker_main then
				return {
					hyper_mult = card.ability.extra.hyper_mult,
					card = card
				}
			end
		end
	}
end