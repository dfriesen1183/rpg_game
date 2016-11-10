{
    var encs = global.record[? "encounters"];
    if (ds_exists(encs, ds_type_list)) {
        encs = ds_list_create();
    } else {
        ds_list_clear(encs);
    }
    global.record[? "encIndex"] = 0;
    
    var duration = global.record[? "duration"];
    var currentTime = irandom_range(10,20);
    for (var i=0; currentTime < duration; i++) {
        encs[| i] = ds_map_create();
        var newEnc = encs[| i];
        newEnc[? "time"] = currentTime;
        newEnc[? "unmet"] = true;
        newEnc[? "type"] = irandom_range(1,100);
        
        currentTime += irandom_range(10,20);
    }
}

