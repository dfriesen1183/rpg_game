{
    //readying record object
    updateSystemTime_scr();
    
    planEncounters_scr();
    if (global.record[? "duration"] <= 0) {
        global.record[? "duration"] = 2*60;
    }
    global.record[? "endTime"] = date_inc_second(global.sysTime[? "val"], global.record[? "duration"]);
    show_debug_message("endTime:");
    show_debug_message(string(date_get_hour(global.record[? "endTime"]))+":"+string(date_get_minute(global.record[? "endTime"]))+":"+string(date_get_second(global.record[? "endTime"])));
    global.record[? "complete"] = false;
    
    //appending active quest
    ds_list_add_map(global.activeQuests, global.record);
    var index = ds_list_size(global.activeQuests) - 1;
    global.quest = index;
    var size = ds_list_size(global.party);
    for (var i=0; i<size; i++) {
        var member = global.party[| i];
        member[? "questIndex"] = index;
    }
    
    var record = global.activeQuests[| global.quest];
    show_debug_message("recorded endTime:");
    show_debug_message(string(date_get_hour(record[? "endTime"]))+":"+string(date_get_minute(record[? "endTime"]))+":"+string(date_get_second(record[? "endTime"])));
    output_list(global.activeQuests);
    

    //readying new object here, so it doesn't have to be done later under more particular circumstances
    global.record = ds_map_create();
    createRecord_scr();
    global.party = global.record[? "party"];

    room_goto(quest_room);
}

