{
    //endQuest_scr(boolean);
    //player given leave; unique information depending on quest success

    var questSuccess = argument0;

    if (questSuccess) {
        genLogEntry_scr("Quest Complete!", true, true);
    } else {
        genLogEntry_scr("Quest Failed!", false, true);
    }
    var newData = createInstance_scr(questMenuComplete_obj, 0,0, 0,0, 0.2,-1);

    saveGame_scr();
}

