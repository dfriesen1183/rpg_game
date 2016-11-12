{
    //encLogic_scr();
    //returns boolean 'quest failure'
    //determines encounter type
    
    var enc = argument0;
    
    genLogEntry_scr("----------", false, false);
    if (enc[? "type"] > 90) {
        //companion generated
        genFoundHero_scr();
    } else if (enc[? "type"] > 75) {
        //loot generated
        genFoundLoot_scr();
    } else {
        //enemy generated
        return genFoundEnemies_scr();
    }
    return false;
}

