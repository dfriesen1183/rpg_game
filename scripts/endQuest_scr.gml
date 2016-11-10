{
    //endQuest_scr(boolean);
    //player given leave; unique information depending on quest success

    var questSuccess = argument0;

    if (questSuccess) {
        genLogEntry_scr("Quest Complete!", true, true);
    } else {
        genLogEntry_scr("Quest Failed!", false, true);
        with (hero_obj) {
            instance_destroy();
        }
        //global.tileSpawner.active = false;
    }
    spawnQuestEndMenu_scr();

    saveGame_scr();
}

