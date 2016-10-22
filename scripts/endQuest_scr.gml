{
    //endQuest_scr(boolean);
    //player given leave; unique information depending on quest success

    var questSuccess = argument0;

    ds_map_replace(global.record, "active", false);
    if (questSuccess) {
        show_debug_message("Quest Complete!");
    } else {
        show_debug_message("Quest Failed!");
    }
    instance_create(0,0,questMenuComplete_obj);

    saveGame_scr();
}

