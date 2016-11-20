{
    updateSystemTime_scr();
    
    
    var rec = global.record;
    
    //appending working record
    ds_list_add_map(global.activeQuests, rec);
    
    rec[? "id"] = random(1);
    global.quest = rec[? "id"];
    
    var size = ds_list_size(global.party);
    for (var i=0; i<size; i++) {
        var member = global.party[| i];
        member[? "questIndex"] = rec[? "id"];
    }
    
    //readying record object
    if (rec[? "duration"] <= 0) {
        rec[? "duration"] = 2*60;
    }
    rec[? "startTime"] = global.sysTime[? "val"];
    rec[? "endTime"] = date_inc_second(global.sysTime[? "val"], rec[? "duration"]);
    rec[? "complete"] = false;
    
    planEncounters_scr();
    
    //readying new object here, so it doesn't have to be done later under more particular circumstances
    resetWorkingRecord_scr();

    room_goto(quest_room);
}

