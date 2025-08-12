-- COLOSSEUM baseV0.0.1
--[[
    COLOSSEUM MODE 
   Colosseum Tweakdefs

   This file dynamically converts all unit build energy costs to metal costs for Colosseum mode.
   For each unit: metalcost = metalcost + (energycost / 70), energycost = 0
   Applies to all units.

    This file is part of the BAR Colosseum mode for Spring RTS.
    

    by Giamme, Pandaro and Fra
    thanks to the Italian BAR community for the help testing and supporting the development of this mode.
]]

local emptyBuildOptions = {
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
    [37] = "",
    [38] = "",
    [39] = "",
    [40] = "",
    [41] = "",
    [42] = "",
}
local battlePhaseTime = 120 -- 5 minutes

local armcom_vanilla = UnitDefs["armcom"]
local corcom_vanilla = UnitDefs["corcom"]
local legcom_vanilla = UnitDefs["legcom"]

local vanilla_coms = {
    arm = armcom_vanilla,
    cor = corcom_vanilla,
    leg = legcom_vanilla,
}

local function deepcopy(orig)
    local orig_type = type(orig)
    local copy
    if orig_type == 'table' then
        copy = {}
        for orig_key, orig_value in next, orig, nil do
            copy[deepcopy(orig_key)] = deepcopy(orig_value)
        end
        setmetatable(copy, getmetatable(orig))
    else
        copy = orig
    end
    return copy
end

local labs_list = {
            armlab = 1 ,
            corlab = 1 ,
            leglab = 1 ,
            corvp = 1 ,
            armvp = 1 ,
            legvp = 1 ,
            armap = 1 ,
            corap = 1 ,
            legap = 1 ,
            armhp = 1 ,
            corhp = 1 ,
            leghp = 1 ,
            armsy = 1 ,
            corsy = 1 ,
            legsy = 1 ,
            armalab = 1 ,
            coralab = 1 ,
            lagalab = 1 ,
            armavp = 1 ,
            coravp = 1 ,
            legavp = 1 ,
            armaap = 1 ,
            coraap = 1 ,
            legaap = 1 ,
            armfhp = 1 ,
            corfhp = 1 ,
            legfhp = 1 ,
            armamsub = 1 ,
            coramsub = 1 ,
            legamsub = 1 ,
            armplat = 1 ,
            corplat = 1 ,
            legplat = 1 ,
            armasy = 1 ,
            corasy = 1 ,
            legasy = 1 ,
            armshltx = 1 ,
            corshltx = 1 ,
            legshltx = 1 ,
            armshltxuw = 1 ,
            legshltxuw = 1 ,
            corshltxuw = 1 ,
        }
local builders_list = {}

local commanders_list = {
    armcom = 1 ,
    corcom = 1 ,
    legcom = 1 ,
}

    local function SetupCommander(unitName)
        local faction = unitName:sub(1, 3) -- Extract the faction from the unit name

        local evoTarget1 = faction .. "comlvl2" -- Set the evolution target for the building phase
        local evoTarget2 = faction .. "comlvl3" -- Set the evolution target for the battle phase

        UnitDefs[unitName].customparams = {
            evolution_condition = "timer",
            evolution_timer = 3,
            evolution_target = evoTarget1 -- Set the evolution target to the next level commander
        }
        UnitDefs[unitName].metalmake = 0
        UnitDefs[unitName].energymake = 0
        UnitDefs[unitName].energystorage = 20000
        UnitDefs[unitName].metalstorage = 20000

        UnitDefs[evoTarget1] = deepcopy(vanilla_coms[faction]) -- Deep copy the vanilla commander definition
        
        -- Set the options for the builder commander
        UnitDefs[evoTarget1].workertime = 99999
        UnitDefs[evoTarget1].buildDistance = 750
        UnitDefs[evoTarget1].metalmake = 0
        UnitDefs[evoTarget1].energymake = 0
        UnitDefs[evoTarget1].energystorage = 20000
        UnitDefs[evoTarget1].metalstorage = 20000
        UnitDefs[evoTarget1].canReclaim = true
        UnitDefs[evoTarget1].buildoptions = {
            [1] = "armlab",
            [2] = "corlab",
            [3] = "leglab",
            [4] = "corvp",
            [5] = "armvp",
            [6] = "legvp",
            [7] = "armap",
            [8] = "corap",
            [9] = "legap",
            [10] = "armhp",
            [11] = "corhp",
            [12] = "leghp",
            [13] = "armsy",
            [14] = "corsy",
            [15] = "legsy",
            [16] = "armalab",
            [17] = "coralab",
            [18] = "lagalab",
            [19] = "armavp",
            [20] = "coravp",
            [21] = "legavp",
            [22] = "armaap",
            [23] = "coraap",
            [24] = "legaap",
            [25] = "armfhp",
            [26] = "corfhp",
            [27] = "legfhp",
            [28] = "armamsub",
            [29] = "coramsub",
            [30] = "legamsub",
            [31] = "armplat",
            [32] = "corplat",
            [33] = "legplat",
            [34] = "armasy",
            [35] = "corasy",
            [36] = "legasy",
            [37] = "armshltx",
            [38] = "corshltx",
            [39] = "legshltx",
            [40] = "armshltxuw",
            [41] = "legshltxuw",
            [42] = "corshltxuw",
        } 
        UnitDefs[evoTarget1].customparams = {
            evolution_condition = "timer_global",
            evolution_timer = battlePhaseTime,
            evolution_target = evoTarget2 -- Set the evolution target to the next level commander
        }

        UnitDefs[evoTarget2] = deepcopy(vanilla_coms[faction]) -- Deep copy the vanilla commander definition

        UnitDefs[evoTarget2].buildoptions = deepcopy(emptyBuildOptions) -- Set build options to empty for the final commander
        UnitDefs[evoTarget2].canReclaim = false -- Disable reclaim for the final commander
        UnitDefs[evoTarget2].metalmake = 0
        UnitDefs[evoTarget2].energymake = 0
        UnitDefs[evoTarget2].energystorage = 20000
        UnitDefs[evoTarget2].metalstorage = 20000
        
    end
    
    
    local function SetupLab(unitName)
        UnitDefs[unitName].metalcost = 0
        UnitDefs[unitName].energycost = 0
    UnitDefs[unitName].buildtime = 1
    UnitDefs[unitName].workertime = 99999
    UnitDefs[unitName].reclaimable = false
    UnitDefs[unitName].canReclaim = false
    
    UnitDefs[unitName].customparams = {
        evolution_condition = "timer_global",
        evolution_timer = battlePhaseTime,
        evolution_target = "armdrag"
    }
    for index, unit in pairs(UnitDefs[unitName].buildoptions) do
        if UnitDefs[unit].buildoptions then
            table.remove(UnitDefs[unitName].buildoptions,index)
        end
    end
    --UnitDefs[unitName].
end

for unitName, unitDef in pairs(UnitDefs) do
    if labs_list[unitName] then
        SetupLab(unitName)
    elseif commanders_list[unitName] then
        SetupCommander(unitName)
    elseif unitName == "armdrag" then
        UnitDefs[unitName].reclaimable = false
    else
        local metal = UnitDefs[unitName].metalcost or 1
        local energy = UnitDefs[unitName].energycost or 0
        local extraMetal = math.floor((energy / 70) + 0.5)
        UnitDefs[unitName].metalcost = math.ceil(( metal + extraMetal ) / 10) --magia magia portami via
        UnitDefs[unitName].energycost = 0

        -- Set energy upkeep to 0 for all units, some units like jammers or commanders have energy upkeep
        -- which is not needed in Colosseum mode.
        UnitDefs[unitName].energyupkeep = 0


        -- Set energypershot and metalpershot to 0 for all units except the disintegrator
        if unitDef.weapondefs then
            for weaponName, weapondef in pairs(unitDef.weapondefs) do
                if(weaponName ~= "disintegrator") then
                    unitDef.weapondefs[weaponName].energypershot = 0
                    unitDef.weapondefs[weaponName].metalpershot = 0
                end
            end
        end
    end


end