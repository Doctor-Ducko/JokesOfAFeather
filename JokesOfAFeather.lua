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
--[[CROSSOVER VARS]]--
JOAF.has_cardsleeves 	= next(SMODS.find_mod("CardSleeves"))

--[[LOAD LISTS]]--
JOAF.load_jokers = {
	-- Common
	"abundant_joker",
	"joker_qm",
	"jokerekoj",
	"binary_joker",
	"simple_joker",
	"sunflower_joker",
	"ace_face",
	"frug",
	"ice_pop_r",
	"ice_pop_b",
	"dark_candy",
	"usb_hub",
	"hardware_fault",
	"recycling_bin",
	"hand_bag",
	"green_card",
	"long_fuse",
	"picture_frame",
	"scissors",
	"misplaced",
	
	-- Uncommon
	"novel_joker",
	"tinkerer_joker",
	"brainless_joker",
	"colorful_joker",
	"lunar_joker",
	"cloudy_joker",
	"boosting_joker",
	"irritating_joker",
	"the_witness",
	"jokr",
	"lil_joker",
	"joker_face",
	"jimbo_jpg",
	"untextured_joker",
	"dr_pepper",
	"ice_pop_g",
	"ice_pop_y",
	"darker_candy",
	"straight_line",
	"square_roots",
	"hands_of_steel",
	"slot_machine",
	"really_misplaced",
	
	-- Rare
	"precious_joker",
	"photographer",
	"comedian",
	"jokerjoker",
	"negative_nancy",
	"evil_joker",
	"house_like_carpet",
	"mia_joker",
	"jramp",
	"redprint",
	"joker_energy",
	"57_leaf_clover",
	"sword",
	"uno_cards",
	"card_belt",
	"gutsy_bat",

	-- Mostly Negative
	"freda",

	-- Legendary
	"emperor",
	"money_smart",
	"flug",

	-- Family
	"peter_griffin",
	"lois_griffin",
	"chris_griffin",
	"meg_griffin",
	"stewie_griffin",
	"brian_griffin",
	"glenn_quagmire",

}

JOAF.load_enhancements = {
	"combo",
	"stained",
	"dynamite",
	"lightweight",
	"untextured",
	"swap",
}

JOAF.load_seals = {
	"pink",
	"navy",
	"orange",
	"lucky",
}

JOAF.load_tarots = {
	"balance",
	"legacy",
	"explosion",
	"clouds",
	"misprint",
	"flip",
}

JOAF.load_spectrals = {
	"multiply",
	"recreate",
	"development",
	"chance",
	"inverter",
}

JOAF.load_trinkets = {
	"trash_bag",
	"gloves",
	"booster_pak",
	"wallet",
	"comic_book",
	"stargazing_guide",
	"psychic_reading",
	"specter",
	"trinkets",
	"potato_chips",
	"math_book",
	"golden_ring",
}

JOAF.load_decks = {
	"tinkerers",
	"glimmering",
	"hikers",
	"family",
	"iconic",
}

JOAF.load_vouchers = {
	"trinket_merchant",
	"trinket_tycoon",
	"shopping_cart",
	"delivery_truck",
	"buddy_system",
	"couch_co_op",
	"trash_bin",
	"dumpster",
}

JOAF.load_boosters = {
	"trinket_normal_1",
	"trinket_normal_2",
	"trinket_jumbo_1",
	"trinket_mega_1",
	"quack_normal_1",
	"quack_normal_2",
	"quack_jumbo_1",
	"quack_mega_1",
	"family_normal",
}

JOAF.load_tags = {
	"feather",
	"wrench",
	"family",
	"gambling",
}

JOAF.load_sleeves = {
	"hikers",
	"family",
	"iconic"
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
    key = "JOAFUNO",
    path = "DuckUNO.png",
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
SMODS.Atlas {
    key = "JOAFTags",
    path = "DuckTags.png",
    px = 34,
    py = 34
}

if JOAF.has_cardsleeves then
	SMODS.Atlas {
		key = "JOAFSleeves",
		path = "DuckSleeves.png",
		px = 73,
		py = 95
	}
end

--[[CONSUMABLES & RARITIES]]--
SMODS.ConsumableType {
	key = "Trinkets",
	collection_rows = {6, 6},
	primary_colour = HEX("FFFFFF"),
	secondary_colour = HEX("D66B1B"), -- Remember to update the loc color in the globals file
	shop_rate = 2,
	loc_txt = {
		name = 'Trinket', -- used on card type badges
		collection = 'Trinket Cards', -- label for the button to access the collection
		undiscovered = { -- description for undiscovered cards in the collection
 			name = 'Not Discovered',
 			text = {
				"Purchase or use",
                "this card in an",
                "unseeded run to",
                "learn what it does"
			},
 		},
	},
}

SMODS.Rarity({
	key = "family",					-- ID, indexed with joaf_[key]
	loc_txt = {
		name = "Family Guy"
	},
	badge_colour = HEX("3b9c14"),	-- Color of the badge
	default_weight = 0.01,			-- Percent chance to find in shops [Common, 0.7 | Uncommon, 0.25 | Rare, 0.05] eval print(G.GAME["joaf_family_mod"])
	pools = {
		["Joker"] = true
	},
})

SMODS.Rarity({
	key = "mostly_negative",					-- ID, indexed with joaf_[key]
	loc_txt = {
		name = "Mostly Negative"
	},
	badge_colour = HEX("c35c2c"),	-- Color of the badge
	default_weight = 0,			-- Percent chance to find in shops [Common, 0.7 | Uncommon, 0.25 | Rare, 0.05] eval print(G.GAME["joaf_family_mod"])
	pools = {
		["Joker"] = true
	},
})

SMODS.Gradient {
	key = "e_chips",
	colours = {
		G.C.DARK_EDITION,
		G.C.CHIPS,
	},
	cycle = 5
}

SMODS.Gradient {
	key = "e_mult",
	colours = {
		G.C.DARK_EDITION,
		G.C.MULT,
	},
	cycle = 5
}

SMODS.Gradient {
	key = "ee_mult",
	colours = {
		HEX("fab1ac"),
		G.C.MULT,
	},
	cycle = 5
}

SMODS.Gradient {
	key = "ee_chips",
	colours = {
		HEX("a7dafa"),
		G.C.CHIPS,
	},
	cycle = 5
}

SMODS.Gradient {
	key = "eee_mult",
	colours = {
		HEX("fab1ac"),
		G.C.MULT,
		G.C.DARK_EDITION,
	},
	cycle = 2.5,
	interpolation = "linear"
}

SMODS.Sound {
	key = "carpet",
	path = {
 		['default'] = 'carpet.ogg',
	}
}

SMODS.ObjectType {
	key = "JOAFJokers",
	default = "j_joaf_frug",
	cards = {},
	rarities = {
		{key = "Common"},
		{key = "Uncommon"},
		{key = "Rare"},
		{key = "Legendary"},
		{key = "joaf_family"},
		{key = "joaf_mostly_negative"},
	},
}
-- eval SMODS.add_card({set = "JOAFJokers", area = G.jokers})

--[[UI FLARE]]
JOAF.ui_config = {
    colour 				= HEX("F19B59"), -- Main UI box
    back_colour 		= G.C.RED, -- Back button
    tab_button_colour 	= G.C.RED, -- Tabs buttons
    author_colour 		= G.C.YELLOW, -- Author text
}

--[[LOADING SECTION]]--
assert(SMODS.load_file("./src/duck_globals.lua"))()
assert(SMODS.load_file("./src/config_tab.lua"))()
assert(SMODS.load_file("./src/credits_tab.lua"))()

for i,v in pairs(JOAF.load_jokers) do
	assert(SMODS.load_file("./src/jokers/" .. v .. ".lua"))()
end

for i,v in ipairs(JOAF.load_enhancements) do
	assert(SMODS.load_file("./src/enhancements/" .. v .. ".lua"))()
end

for i,v in ipairs(JOAF.load_seals) do
	assert(SMODS.load_file("./src/seals/" .. v .. ".lua"))()
end

for i,v in ipairs(JOAF.load_tarots) do
	assert(SMODS.load_file("./src/consumables/tarot/" .. v .. ".lua"))()
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

for i,v in ipairs(JOAF.load_tags) do
	assert(SMODS.load_file("./src/tags/" .. v .. ".lua"))()
end

if JOAF.has_cardsleeves then
	for i,v in ipairs(JOAF.load_sleeves) do
		assert(SMODS.load_file("./src/sleeves/" .. v .. ".lua"))()
	end
end

--[[HOOKS]]--
to_big = to_big or function(x) return x end

local igo = Game.init_game_object
function Game:init_game_object()
	local ret = igo(self)
	ret.current_round.colorful_joker = { suit = 'Spades' }
	return ret
end

local cfbs = G.FUNCS.check_for_buy_space
G.FUNCS.check_for_buy_space = function(card)
	-- this fucking sucks
	if type(card.ability.extra) == "table" then
		if (card.ability.extra.joker_slots ~= nil) then
			if card.ability.extra.joker_slots >= 1 then
				return true
			end
		end
	end
	return cfbs(card)
end

function SMODS.current_mod.reset_game_globals(run_start)
	-- The suit changes every round, so we use reset_game_globals to choose a suit.
	G.GAME.current_round.colorful_joker = { suit = 'Spades' }
	local valid_colorful_cards = {}
	for _, v in ipairs(G.playing_cards) do
		if not SMODS.has_no_suit(v) then -- Abstracted enhancement check for jokers being able to give cards additional enhancements
			valid_colorful_cards[#valid_colorful_cards + 1] = v
		end
	end
	if valid_colorful_cards[1] then
		local colorful_joker = pseudorandom_element(valid_colorful_cards, pseudoseed('colorful_joker' .. G.GAME.round_resets.ante))
		G.GAME.current_round.colorful_joker.suit = colorful_joker.base.suit
	end
end