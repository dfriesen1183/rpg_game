{
    //genFoundLoot_scr();
    //generates equipment, gold

    var equipChance = floor(random(100));
    while (equipChance > 80) {
        var msg = "found equipment";
        show_debug_message(msg);
        genLogEntry_scr(msg);
        // global.record.equip...
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
    var msg = "found "+string(gold)+" gold";
    show_debug_message(msg);
    genLogEntry_scr(msg);
    var currentGold = ds_map_find_value(global.record,"gold") + gold;
    ds_map_replace(global.record, "gold", gold);
    // could have party reactions here, maybe
}
