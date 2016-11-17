{
    //genFoundLoot_scr();
    //generates equipment, gold
 
    
    var questId = argument0;
    var quest = getQuestIndex_scr(questId);
    var enc = argument1;
    var record = enc[? "record"];
    var party = record[? "party"];


    var equipChance = floor(random(100));
    while (equipChance > 80) {
        //genLogEntry_scr(record, "found equipment", false, false);
        // record.equip...
        equipChance = floor(random(100));
    }
    var goldChance = floor(random(100));
    var gold = floor(random_range(1,4));
    var recurGoldChance = 70; // becomes 30, 54, 69, 80...
    while (goldChance > 100 - recurGoldChance) {
        gold += floor(random_range(20,51));
        goldChance = floor(random(100));
        recurGoldChance /= 1.5;
    }
    genLogEntry_scr(record, "found "+string(gold)+" gold", true, false);
    record[? "gold"] += gold;
    
    var push = enc[? "push"];
    push[| 2] = "Found loot!";
    push[| 3] = "Found "+string(gold)+"gold!";
    // could have party reactions here, maybe
}

