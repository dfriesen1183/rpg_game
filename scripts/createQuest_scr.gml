{
    updateSystemTime_scr();
    
    //appending working record
    show_debug_message("base record:");
    output_map(global.record);
    ds_list_add_map(global.activeQuests, global.record);
    var index = ds_list_size(global.activeQuests) - 1;
    show_debug_message("activeQuest index:");
    output_map(global.activeQuests[| index]);
    global.quest = index;
    
    var size = ds_list_size(global.party);
    for (var i=0; i<size; i++) {
        var member = global.party[| i];
        member[? "questIndex"] = index;
    }
    
    //readying record object
    if (global.record[? "duration"] <= 0) {
        global.record[? "duration"] = 2*60;
    }
    global.record[? "endTime"] = date_inc_second(global.sysTime[? "val"], global.record[? "duration"]);
    global.record[? "complete"] = false;
    
    planEncounters_scr();
    
    //readying new object here, so it doesn't have to be done later under more particular circumstances
    resetWorkingRecord_scr();

    room_goto(quest_room);
}

