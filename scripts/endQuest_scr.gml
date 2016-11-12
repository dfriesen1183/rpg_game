{
    //endQuest_scr(boolean);
    //player given leave; unique information depending on quest success

    var record = argument0;

    if (record[? "success"]) {
        genLogEntry_scr(record, "Quest Complete!", true, true);
    } else {
        genLogEntry_scr(record, "Quest Failed!", false, true);
        with (hero_obj) {
            instance_destroy();
        }
        //global.tileSpawner.active = false;
    }
    spawnQuestEndMenu_scr();

    saveGame_scr();
}

