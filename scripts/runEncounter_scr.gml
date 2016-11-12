{
    var rec = argument0;
    var enc = argument1;

    
    var result = true;
    genLogEntry_scr(rec, "----------", false, false);
    if (enc[? "type"] > 90) {
        //companion generated
        genFoundHero_scr(rec);
    } else if (enc[? "type"] > 75) {
        //loot generated
        genFoundLoot_scr(rec);
    } else {
        //enemy generated
        result = genFoundEnemies_scr(rec);
    }

    if (result) {
        //updateClock_scr(global.cwestCloc);
    } else {
        saveGame_scr();
        return 1;
    }
}

