{
    var encType = ceil(random(100)); //percentage-based
    if (encType > 90) {
        //companion generated
        genFoundHero_scr();
    } else if (encType > 75) {
        //loot generated
        genFoundLoot_scr();
    } else {
        //enemy generated
        genFoundEnemies_scr();
        if (ds_list_size(global.party) <= 0) {
            show_debug_message("Party defeated");
            return 0;
        } else {
            show_debug_message("Enemy party defeated");
        }
    }
    return 1;
}

