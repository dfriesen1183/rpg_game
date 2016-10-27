{
    //endQuest_scr(boolean);
    //player given leave; unique information depending on quest success

    var questSuccess = argument0;

    if (questSuccess) {
        genLogEntry_scr("Quest Complete!", true, true);
    } else {
        genLogEntry_scr("Quest Failed!", false, true);
    }
    instance_create(0,0,questMenuComplete_obj);

    saveGame_scr();
}

