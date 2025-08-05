--[[
    COLOSSEUM MODE 
  Colosseum Base Tweakunits

  This file defines custom unit tweaks for the Colosseum game mode in BAR.
  It overrides the build options and properties for factories, constructors, and commanders,
  restricting them to mobile units from all factions and disabling reclaiming.
  Units evolve at the 5 minutes mark, and special rules are applied to support the custom game mode.

  Pair this with the other mode modules for a complete Colosseum experience.
  - Colosseum Units Costs
  - Colosseum Units Energy Consumption Fix
  - Colosseum Units Limits

    This file is part of the BAR Colosseum mode for Spring RTS.

    by Giamme, Pandaro, Fra
    thanks to all BAR Italian community for testing and feedback
]]
{
    armhp = {
        canReclaim = false,
        workertime = 99999,
        metalcost = 500,
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
            evolution_timer = 300,
            evolution_target = "armdrag"
        }
    }, 
    armlab = {
        canReclaim = false,
        workertime = 99999,
        metalcost = 500,
        energycost = 0,
        reclaimable = false,
        buildoptions = {
            -- All bot units from all factions 
            [1] = "armpw", [2] = "armwar", [3] = "armmav", [4] = "armsnipe", [5] = "armflea", [6] = "armzeus", [7] = "armfast", [8] = "armspid", [9] = "armvader",
            [10] = "corak", [11] = "corstorm", [12] = "corpyro", [13] = "corthud", [14] = "corroach", [15] = "corcrash", [16] = "coramph", [17] = "corcan", [18] = "cornecro",
            [19] = "leginf", [20] = "legbal", [21] = "legkark", [22] = "legstr", [23] = "leghelios", [24] = "leghades", [25] = "legrail", [26] = "legmrv", [27] = "legshot",
            [28] = "armmar", [29] = "armcat", [30] = "corkarg", [31] = "armmamth"
        },
        customparams = {
            evolution_condition = "timer_global",
            evolution_timer = 300,
            evolution_target = "armdrag"
        }
    },
    corvp = {
        canReclaim = false,
        workertime = 99999,
        metalcost = 500,
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
            evolution_timer = 300,
            evolution_target = "armdrag"
        }
    },
    armsy = {
        canReclaim = false,
        workertime = 99999,
        metalcost = 500,
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
            evolution_timer = 300,
            evolution_target = "armdrag"
        }
    },
    corap = {
        canReclaim = false,
        workertime = 99999,
        metalcost = 1000,
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
            evolution_timer = 300,
            evolution_target = "armdrag"
        }
    },
    armdrag = { 
        reclaimable = false
    },
    armcom = {
        canReclaim = true,
        workertime = 99999,
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
        energymake = 10000,
        energystorage = 20000,
        customparams = {
            evolution_condition = "timer_global",
            evolution_timer = 300,
            evolution_target = "armcomlvl2"
        }
    }, 
    corcom = {
        canReclaim = true,
        metalmake = 0,
        energymake = 10000,
        energystorage = 20000,
        workertime = 99999,
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
        customparams = {
            evolution_condition = "timer_global",
            evolution_timer = 300,
            evolution_target = "corcomlvl2"
        }
    },
    armcomlvl2 = {
        canReclaim = false,
        maxDamage = 4000,
        workertime = 300,
        metalmake = 0,
        energymake = 10000,
        energystorage = 20000,
        metalstorage = 1000,
        buildoptions = {
            [1] = "",
            [2] = "",
            [3] = "",
            [4] = "",
            [5] = "",
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
    corcomlvl2 = {
        canReclaim = false,
        maxDamage = 4000,
        workertime = 300,
        metalmake = 0,
        energymake = 10000,
        energystorage = 20000,
        metalstorage = 1000,
        buildoptions = {
            [1] = "",
            [2] = "",
            [3] = "",
            [4] = "",
            [5] = "",
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
    }
}
