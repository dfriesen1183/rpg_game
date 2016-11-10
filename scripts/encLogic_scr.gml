{
    //encLogic_scr();
    //returns boolean 'quest failure'
    //determines encounter type
    
    genLogEntry_scr("----------", false, false);
    var encType = irandom_range(1,100); //percentage-based
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

