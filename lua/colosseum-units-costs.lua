-- COLOSSEUM units-costs
--[[
    COLOSSEUM MODE 
   Colosseum Tweakdefs

   This file dynamically converts all unit build energy costs to metal costs for Colosseum mode.
   For each unit: metalcost = metalcost + (energycost / 70), energycost = 0
   Applies to all units.

    This file is part of the BAR Colosseum mode for Spring RTS.
    

    by Giamme, Pandaro and Fra
]]

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

local function SetupLab(unitName)
    UnitDefs[unitName].metalcost = 0
    UnitDefs[unitName].energycost = 0
    UnitDefs[unitName].buildtime = 1
    UnitDefs[unitName].workertime = 99999
    UnitDefs[unitName].reclaimable = false
    UnitDefs[unitName].canReclaim = false
    
    UnitDefs[unitName].customparams = {
        evolution_condition = "timer_global",
        evolution_timer = 120,
        evolution_target = "armdrag"
    }
    --UnitDefs[unitName].
end

for unitName, unitDef in pairs(UnitDefs) do
    if labs_list[unitName] then
        SetupLab(unitName)
    elseif UnitDefs[unitName].buildoptions then
        --pass
    else
        local metal = UnitDefs[unitName].metalcost or 1
        local energy = UnitDefs[unitName].energycost or 0
        local extraMetal = math.floor((energy / 70) + 0.5)
        UnitDefs[unitName].metalcost = metal + extraMetal 
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