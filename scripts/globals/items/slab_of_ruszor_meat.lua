-----------------------------------------
-- ID: 5755
-- Item: Slab of Ruszor Meat
-- Food Effect: 30Min, Galka only
-----------------------------------------
-- Strength 5
-- Intelligence -7
-----------------------------------------
require("scripts/globals/status");
-----------------------------------------

function onItemCheck(target)
    local result = 0;
    if (target:getRace() ~= 8) then
        result = 247;
    end
    if (target:getMod(MOD_EAT_RAW_MEAT) == 1) then
        result = 0;
    end
    if (target:hasStatusEffect(EFFECT_FOOD) == true or target:hasStatusEffect(EFFECT_FIELD_SUPPORT_FOOD) == true) then
        result = 246;
    end
    return result;
end;

function onItemUse(target)
    target:addStatusEffect(EFFECT_FOOD,0,0,1800,5755);
end;

-----------------------------------------
-- onEffectGain Action
-----------------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_STR, 5);
    target:addMod(MOD_INT, -7);
end;

function onEffectLose(target, effect)
    target:delMod(MOD_STR, 5);
    target:delMod(MOD_INT, -7);
end;
