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
for unitName, unitDef in pairs(UnitDefs) do
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