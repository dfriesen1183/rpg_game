{
    global.sysTime = -1;
    var file = global.savePrefix+"sysTime"+global.saveExt;
    if (file_exists(file)) {
        global.sysTime = ds_map_secure_load(file);
    }
    if (is_undefined(global.sysTime) || !ds_exists(global.sysTime, ds_type_map)) {
        global.sysTime = ds_map_create();
        global.sysTime[? "val"] = date_current_datetime();
    }
}

