{
    show_debug_message("----------");
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
    return 0;
}

