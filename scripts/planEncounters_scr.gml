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
    ds_map_copy(encRec, global.record);
    ds_map_delete(encRec, "pastEnc");
    ds_map_delete(encRec, "futureEnc");
    
    var duration = global.record[? "duration"];
    var currentTime = irandom_range(10,20);
    
    var questViable = true;
    
    //keepNotifying conditional to prevent unnecessary load on quest startup from generation of unused encounters
    for (var i=0; currentTime < duration && questViable; i++) {
        var newEnc = ds_map_create();
        ds_list_add_map(encs, newEnc);
        
        newEnc[? "time"] = date_inc_second(global.sysTime[? "val"], currentTime);
        newEnc[? "type"] = irandom_range(1,100);
        ds_map_add_map(newEnc, "record", encRec);
        var result = simEncounter_scr(questId, i);
        
        currentTime += irandom_range(10,20);
        if (currentTime < duration) {
            if (0 != result) {
                questViable = false;
            } else { //normally would be alongside if above, but put here to prevent memory leak from early loop exit via keepNotifying
                encRec = ds_map_create();
                ds_map_copy(encRec, newEnc[? "record"]);
            }
        }
    }
}

