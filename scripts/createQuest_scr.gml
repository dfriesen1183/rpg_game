{
    updateSystemTime_scr();
    
    //appending working record
    ds_list_add_map(global.activeQuests, global.record);
    
    global.record[? "id"] = random(1);
    show_debug_message(global.record[? "id"]);
    global.quest = global.record[? "id"];
    
    var size = ds_list_size(global.party);
    for (var i=0; i<size; i++) {
        var member = global.party[| i];
        member[? "questIndex"] = global.record[? "id"];
    }
    
    //readying record object
    if (global.record[? "duration"] <= 0) {
        global.record[? "duration"] = 2*60;
    }
    global.record[? "endTime"] = date_inc_second(global.sysTime[? "val"], global.record[? "duration"]);
    global.record[? "complete"] = false;
    
    show_debug_message("outbound party");
    output_list(global.party);
    
    planEncounters_scr();
    
    //readying new object here, so it doesn't have to be done later under more particular circumstances
    resetWorkingRecord_scr();

    room_goto(quest_room);
}

