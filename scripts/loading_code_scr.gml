{
    //loading_code_scr()
    //(called from loading_room creation code)
    //preliminary loading
    //  loads data
    //  if quest is active, automatically redirects there

    //randomize(); //randomizes seed
    loadGame_scr();

    show_debug_message("next room...");
    if (ds_map_find_value(global.record, "complete")) {
        show_debug_message("main");
        room_goto(mainMenuMain_room);
    } else {
        var time = ds_map_find_value(global.record, "time");
        var duration = ds_map_find_value(global.record, "duration");
    var output = json_encode(global.record);
    show_debug_message(output);
        if (time < duration) {
            show_debug_message("quest");
            room_goto(quest_room);
        } else {
            show_debug_message("review");
            room_goto(questReview_room);
        }
    }
}

