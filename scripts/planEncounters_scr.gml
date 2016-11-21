{
    var encs = global.record[? "futureEnc"];
    if (!is_undefined(encs) && ds_exists(encs, ds_type_list)) {
        ds_list_clear(encs);
    } else {
        ds_map_add_list(global.record, "futureEnc", ds_list_create());
        encs = global.record[? "futureEnc"];
    }
    
    var questId = global.record[? "id"];
        
    var encRec = ds_map_create();
    duplicateRecord_scr(encRec, global.record);
    
    var duration = global.record[? "duration"];
    var startRange = 10;//duration/6;
    var endRange = 20;//duration/3;
    var currentTime = irandom_range(startRange,endRange);
    
    var questViable = true;
    var newEnc;
    
    //questViable conditional to prevent unnecessary load on quest startup from generation of unused encounters
    for (var i=0; currentTime < duration; i++) {
        newEnc = ds_map_create();
        ds_list_add_map(encs, newEnc);
        
        newEnc[? "time"] = date_inc_second(global.sysTime[? "val"], currentTime);
        newEnc[? "type"] = irandom_range(1,100);
        ds_map_add_map(newEnc, "record", encRec);
        if (false == encRec[? "complete"]) {
            var result = simEncounter_scr(questId, i);
        }
        
        currentTime += irandom_range(startRange,endRange);
        if (currentTime < duration) {
            if (false == encRec[? "complete"] && 0 != result) {
                encRec[? "complete"] = true;
                encRec[? "success"] = false;
                questViable = false;
            } else { //normally would be alongside if above, but put here to prevent memory leak from early loop exit via questViable
                encRec = ds_map_create();
                duplicateRecord_scr(encRec, newEnc[? "record"]);
            }
        }
    }
    
    var push = ds_list_create();
    global.record[? "push"] = push;
    push[| 0] = true;
    if (questViable) {
        encRec[? "complete"] = true;
        encRec[? "success"] = true;
        //genLogEntry_scr(newEnc[? "record"], "Quest Complete!", true, true);
        push[| 1] = date_inc_second(global.sysTime[? "val"], duration);
        push[| 2] = "Quest Complete!";
        push[| 3] = "The party successfully completed a "+secToTime_scr(duration)+" quest!";
    } else {
        //genLogEntry_scr(newEnc[? "record"], "Quest Failed!", false, true);
        push[| 1] = newEnc[? "time"];
        push[| 2] = "Quest Failed...";
        push[| 3] = "The party failed to complete a "+secToTime_scr(duration)+" quest";
    }
    push[| 4] = string(questId);
    resetOnePush_scr(push);
}

