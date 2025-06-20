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
JOAF.has_cardsleeves 	= next(SMODS.find_mod("CardSleeves"))
JOAF.has_cryptid 		= next(SMODS.find_mod("Cryptid"))
JOAF.has_joaf_bp		= next(SMODS.find_mod("JokesOfAFeatherBoosterPak"))

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
	"hardware_fault",
	"frug",
	"dark_candy",
	"recycling_bin",
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
	"irritating_joker",
	"the_witness",
	"jokr",
	"lil_joker",
	"joker_face",
	"jimbo_jpg",
	"dr_pepper",
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
	"evil_joker",
	"house_like_carpet",
	"mia_joker",
	"jramp",
	"blueprint_rotated",
	"joker_energy",
	"57_leaf_clover",
	"uno_cards",
	"card_belt",
	"gutsy_bat",

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
	"trash_bin",
	"dumpster",
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


SMODS.Sound {
	key = "carpet",
	path = {
 		['default'] = 'carpet.ogg',
	}
}

--[[LOADING SECTION]]--
assert(SMODS.load_file("./src/duck_globals.lua"))()
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

-- secret !!
if JOAF.has_cryptid then
	SMODS.Joker {
		key = 'catastrophic_joker',
		atlas = 'JOAFJokers',
		pos = { x = 0, y = 0 }, -- works on a +1 increment, not based off of pixels
		rarity = "cry_exotic", -- 1: common, 2: uncommon, 3: rare, 4: legendary
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

