-- COLOSSEUM MODE v0.0.1
--[[
    COLOSSEUM MODE 
  Colosseum Base Tweakunits

  This file defines custom unit tweaks for the Colosseum game mode in BAR.
  It overrides the build options and properties for factories, constructors, and commanders,
  restricting them to mobile units from all factions and disabling reclaiming.
  Units evolve at the 5 minutes mark, and special rules are applied to support the custom game mode.

  Pair this with the other mode module for a complete Colosseum experience.
  - Colosseum Units Costs 

    This file is part of the BAR Colosseum mode for Spring RTS.

    by Giamme, Pandaro, Fra
    thanks to all BAR Italian community for testing and feedback
]]
{
    armhp = {
        canReclaim = false,
        workertime = 99999,
        metalcost = 0,
        energycost = 0,
        reclaimable = false,
        buildoptions = {
            -- All hovercraft units from all factions
            [1] = "armhover", [2] = "armcroc", [3] = "armsh", [4] = "armmh", [5] = "armch", [6] = "armah", [7] = "armjeth", [8] = "armbeaver",
            [9] = "corhover", [10] = "corcroc", [11] = "corah", [12] = "corch", [13] = "corjeth", [14] = "corseal", [15] = "corparrow", [16] = "corhunt",
            [17] = "leghover"
        },
        customparams = {
            evolution_condition = "timer_global",
            evolution_timer = 120,
            evolution_target = "armdrag"
        }
    }, 
    armlab = {
        canReclaim = false,
        workertime = 99999,
        metalcost = 0,
        energycost = 0,
        reclaimable = false,
        buildoptions = {
            -- All bot units from all factions 
            [1] = "armflea", [2] = "armpw", [3] = "armrock", [4] = "armjeth", [5] = "armham", [6] = "armrectr", [7] = "armwar", [8] = "armvader", [9] = "armaser",
            [10] = "armmark", [11] = "armspy", [12] = "armfast", [13] = "armspid", [14] = "armamph", [15] = "armfido", [16] = "armzeus", [17] = "armsptk", [18] = "armaak",
            [19] = "armmav", [20] = "armsnipe", [21] = "armdecon", [22] = "armfboy", [23] = "armmar", [24] = "armvang", [25] = "armraz", [26] = "armpanth", [27] = "corak",
            [28] = "corstorm", [29] = "corcrash", [30] = "cornecro", [31] = "corthud", [32] = "corroach", [33] = "corspec", [34] = "corvoyr", [35] = "corspy", [36] = "corpyro", 
            [37] = "coramph", [38] = "cormort", [39] = "cortermite", [40] = "corcan", [41] = "corhrk", [42] = "coraak", [43] = "cordecon", [44] = "corsktl", [45] = "cormando",
            [46] = "corsumo", [47] = "corshiva", [48] = "corkarg", [49] = "corcat", [50] = "cordemon", [51] = "corjugg", [52] = "corkorg"
        },
        customparams = {
            evolution_condition = "timer_global",
            evolution_timer = 120,
            evolution_target = "armdrag"
        }
    },
    corvp = {
        canReclaim = false,
        workertime = 99999,
        metalcost = 0,
        energycost = 0,
        reclaimable = false,
        buildoptions = {
            -- All vehicle units from all factions 
            [1] = "corfav", [2] = "cormlv", [3] = "corgator", [4] = "cormist", [5] = "corwolv", [6] = "corgarp", [7] = "corlevlr",
            -- T2
            [8] = "corraid", [9] = "corvrad", [10] = "coreter", [11] = "corsala", [12] = "cormart", [13] = "corsent", [14] = "correap",
            [15] = "corvroc", [16] = "corban", [17] = "corparrow", [18] = "corgol", [19] = "cortrem", 
            -- Arm
            [20] = "armfav", [21] = "armmlv", [22] = "armflash",
            [23] = "armart", [24] = "armsam", [25] = "armpincer", [26] = "armstump", [27] = "armjanus",
            -- T2
            [28] = "armjam", [29] = "armseer", [30] = "armgremlin",
            [31] = "armmart", [32] = "armlatnk", [33] = "armyork", [34] = "armcroc", [35] = "armmerl", [36] = "armbull", [37] = "armmanni",
            [38] = "armthor"
        },
        customparams = {
            evolution_condition = "timer_global",
            evolution_timer = 120,
            evolution_target = "armdrag"
        }
    },
    armsy = {
        canReclaim = false,
        workertime = 99999,
        metalcost = 0,
        energycost = 0,
        reclaimable = false,
        buildoptions = {
            -- All naval units from all factions
            [1] = "armpt", [2] = "armroy", [3] = "armcrus", [4] = "armbats", [5] = "armcarry", [6] = "armmship", [7] = "armsub",
            [8] = "corpt", [9] = "corroy", [10] = "corcrus", [11] = "corbats", [12] = "corcarry", [13] = "cormship", [14] = "corsub",
            [15] = "leghover", [16] = "legcar", [17] = "legbats", [18] = "legsub"
        },
        customparams = {
            evolution_condition = "timer_global",
            evolution_timer = 120,
            evolution_target = "armdrag"
        }
    },
    corap = {
        canReclaim = false,
        workertime = 99999,
        metalcost = 0,
        energycost = 0,
        reclaimable = false,
        buildoptions = {
            -- All air units from all factions
            [1] = "armpeep", [2] = "armfig", [3] = "armthund", [4] = "armhawk", [5] = "armliche", [6] = "armstil", [7] = "armseap", [8] = "armbrawl",
            [9] = "corfink", [10] = "corvamp", [11] = "corape", [12] = "corhurc", [13] = "corcrw", [14] = "corawac", [15] = "corseap", [16] = "corbrawl",
            [17] = "legmosq", [18] = "legbat", [19] = "legbomb", [20] = "legfighter", [21] = "leggunship", [22] = "legtransport"
        },
        customparams = {
            evolution_condition = "timer_global",
            evolution_timer = 120,
            evolution_target = "armdrag"
        }
    },
    armdrag = { 
        reclaimable = false
    }, 
    armcom = {
        canReclaim = true,
        buildoptions = {
            [1] = "corap",
            [2] = "armsy",
            [3] = "corvp",
            [4] = "armhp",
            [5] = "armlab",
            [6] = "",
            [7] = "",
            [8] = "",
            [9] = "",
            [10] = "",
            [11] = "",
            [12] = "",
            [13] = "",
            [14] = "",
            [15] = "",
            [16] = "",
            [17] = "",
            [18] = "",
            [19] = "",
            [20] = "",
            [21] = "",
            [22] = "",
            [23] = "",
            [24] = "",
            [25] = "",
            [26] = "",
            [27] = "",
            [28] = "",
            [29] = "",
            [30] = "",
            [31] = "",
            [32] = "",
            [33] = "",
            [34] = "",
            [35] = "",
            [36] = "",
            [37] = ""
        }, 
        metalmake = 0,
        energymake = 0,
        energystorage = 20000,

    }, 
    corcom = {
        canReclaim = true,
        metalmake = 0,
        energymake = 0,
        energystorage = 20000,
        buildoptions = {
            [1] = "corap",
            [2] = "armsy",
            [3] = "corvp",
            [4] = "armhp",
            [5] = "armlab",
            [6] = "",
            [7] = "",
            [8] = "",
            [9] = "",
            [10] = "",
            [11] = "",
            [12] = "",
            [13] = "",
            [14] = "",
            [15] = "",
            [16] = "",
            [17] = "",
            [18] = "",
            [19] = "",
            [20] = "",
            [21] = "",
            [22] = "",
            [23] = "",
            [24] = "",
            [25] = "",
            [26] = "",
            [27] = "",
            [28] = "",
            [29] = "",
            [30] = "",
            [31] = "",
            [32] = "",
            [33] = "",
            [34] = "",
            [35] = "",
            [36] = "",
            [37] = ""
        }, 
    },
}
