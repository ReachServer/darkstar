-----------------------------------------
-- ID: 5477
-- Warrior Die
-- Teaches the job ability Fighter's Roll
-----------------------------------------

function onItemCheck(target)
    return target:canLearnAbility(100);
end;

function onItemUse(target)
    target:addLearnedAbility(100);
end;