{
    //loading_code_scr()
    //(called from loading_room creation code)
    //preliminary loading
    //  loads data
    //  if quest is active, automatically redirects there

    //randomize(); //randomizes seed
    loadGame_scr();
    createNewData_scr();
    ds_map_delete(global.record, "log");
    ds_map_add_list(global.record, "log", ds_list_create());
    global.logText = ds_map_find_value(global.record, "log");
    for (var i=0; i<10; i++) {
        ds_list_add(global.logText, "DFJKDLAFJDKLAFJKDLA;FJKDLA;FJKDLAS;FJKDSLA;FJKDLSA;FJKDSLA;FJKDSAL;FJDSKAL;");
    }
    global.logText = ds_map_find_value(global.record, "log");
    global.logObj = ds_list_create();

    if (ds_map_find_value(global.record, "complete") == true) {
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

