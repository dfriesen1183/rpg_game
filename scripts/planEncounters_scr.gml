{
    var encs = global.record[? "encounters"];
    if (!is_undefined(encs) && ds_exists(encs, ds_type_list)) {
        ds_list_clear(encs);
    } else {
        ds_map_add_list(global.record, "encounters", ds_list_create());
        encs = global.record[? "encounters"];
    }
    global.record[? "encIndex"] = 0;
    
    var duration = global.record[? "duration"];
    var currentTime = irandom_range(10,20);
    for (var i=0; currentTime < duration; i++) {
        var newEnc = ds_map_create();
        ds_list_add_map(encs, newEnc);
        newEnc[? "time"] = currentTime;
        newEnc[? "unmet"] = true;
        newEnc[? "type"] = irandom_range(1,100);
        
        currentTime += irandom_range(10,20);
    }
}

