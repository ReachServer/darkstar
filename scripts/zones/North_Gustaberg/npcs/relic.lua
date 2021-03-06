-----------------------------------
-- Area: North Gustaberg
-- NPC:  <this space intentionally left blank>
-- !pos -217 97 461 106
-----------------------------------
package.loaded["scripts/zones/North_Gustaberg/TextIDs"] = nil;
-----------------------------------

require("scripts/zones/North_Gustaberg/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
   -- Working on correct relic, 4 items, Stage 4 item, Shard, Necropsyche, currencypiece
   if (player:getVar("RELIC_IN_PROGRESS") == 18305 and trade:getItemCount() == 4 and trade:hasItemQty(18305,1) and
       trade:hasItemQty(1577,1) and trade:hasItemQty(1589,1) and trade:hasItemQty(1451,1)) then
         player:startEvent(254,18306);
   end
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    player:messageSpecial(NOTHING_OUT_OF_ORDINARY);
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
   if (csid == 254) then
      if (player:getFreeSlotsCount() < 2) then
         player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,18306);
         player:messageSpecial(FULL_INVENTORY_AFTER_TRADE,1450);
      else
         player:tradeComplete();
         player:addItem(18306);
         player:addItem(1450,30);
         player:messageSpecial(ITEM_OBTAINED,18306);
         player:messageSpecial(ITEMS_OBTAINED,1450,30);
         player:setVar("RELIC_IN_PROGRESS",0);
      end
   end
end;