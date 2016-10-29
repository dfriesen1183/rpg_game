{
    //loading_code_scr()
    //(called from loading_room creation code)
    //preliminary loading
    //  loads data
    //  if quest is active, automatically redirects there

    //randomize(); //randomizes seed
    loadGame_scr();

    if (ds_map_find_value(global.record, "complete")) {
        room_goto(mainMenuMain_room);
    } else {
        var time = ds_map_find_value(global.record, "time");
        var duration = ds_map_find_value(global.record, "duration");
        if (time < duration) {
            room_goto(quest_room);
        } else {
            room_goto(questReview_room);
        }
    }
}

