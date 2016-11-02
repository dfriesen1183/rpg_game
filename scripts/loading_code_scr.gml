{
    //loading_code_scr()
    //(called from loading_room creation code)
    //preliminary loading
    //  loads data
    //  if quest is active, automatically redirects there

    //randomize(); //randomizes seed
    texture_set_interpolation(false);
    global.roomWidth = room_width;
    global.roomHeight = room_height;
    
    loadGame_scr();

    if (ds_map_find_value(global.record, "complete")) {
        setGroundState_scr();
        room_goto(mainMenuMain_room);
    } else {
        /*var time = ds_map_find_value(global.record, "time");
        var duration = ds_map_find_value(global.record, "duration");
        if (time < duration) {*/
        
            //extra "quest complete" log entry generate as a result of not going directly to review after reload
            room_goto(quest_room);
        /*} else {
            room_goto(questReview_room);
        }*/
    }
}

