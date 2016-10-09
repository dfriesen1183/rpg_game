{
    show_debug_message("creating encounter");
    var encType = ceil(random(100)); //percentage-based
    if (encType > 95) { //companion generated
        genFoundHero_scr();
    } else if (encType > 80) {
        genFoundLoot_scr();
    } else {
        genFoundEnemies_scr();
    }
}

