-----------------------------------------
-- Spell: Army's Paeon IV
-- Gradually restores target's HP.
-----------------------------------------
require("scripts/globals/status");
require("scripts/globals/msg");
-----------------------------------------

function onMagicCastingCheck(caster,target,spell)
    return 0;
end;

function onSpellCast(caster,target,spell)
    local sLvl = caster:getSkillLevel(SKILL_SNG); -- Gets skill level of Singing
    local iLvl = caster:getWeaponSkillLevel(SLOT_RANGED);

    local power = 4;

    if (sLvl+iLvl > 250) then
        power = power + 1;
    end

    local iBoost = caster:getMod(MOD_PAEON_EFFECT) + caster:getMod(MOD_ALL_SONGS_EFFECT);
    power = power + iBoost;

    if (caster:hasStatusEffect(EFFECT_SOUL_VOICE)) then
        power = power * 2;
    elseif (caster:hasStatusEffect(EFFECT_MARCATO)) then
        power = power * 1.5;
    end
    caster:delStatusEffect(EFFECT_MARCATO);

    local duration = 120;
    duration = duration * ((iBoost * 0.1) + (caster:getMod(MOD_SONG_DURATION_BONUS)/100) + 1);

    if (caster:hasStatusEffect(EFFECT_TROUBADOUR)) then
        duration = duration * 2;
    end

    if not (target:addBardSong(caster,EFFECT_PAEON,power,0,duration,caster:getID(), 0, 4)) then
        spell:setMsg(msgBasic.MAGIC_NO_EFFECT);
    end

    return EFFECT_PAEON;
end;
