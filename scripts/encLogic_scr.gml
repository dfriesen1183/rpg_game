{
    //encLogic_scr();
    //returns boolean 'quest failure'
    //determines encounter type
    
    var msg = "----------";
    show_debug_message(msg);
    genLogEntry_scr(msg);
    var encType = ceil(random(100)); //percentage-based
    if (encType > 90) {
        //companion generated
        genFoundHero_scr();
    } else if (encType > 75) {
        //loot generated
        genFoundLoot_scr();
    } else {
        //enemy generated
        return genFoundEnemies_scr();
    }
    return false;
}

