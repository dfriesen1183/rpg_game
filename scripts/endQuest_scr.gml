{
    //endQuest_scr(boolean);
    //player given leave; unique information depending on quest success

    var questSuccess = argument0;

    if (questSuccess) {
        var msg = "Quest Complete!";
        show_debug_message(msg);
        genLogEntry_scr(msg);
    } else {
        var msg = "Quest Failed!";
        show_debug_message(msg);
        genLogEntry_scr(msg);
    }
    instance_create(0,0,questMenuComplete_obj);

    saveGame_scr();
}

