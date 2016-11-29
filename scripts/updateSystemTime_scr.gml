{
    if (is_undefined(global.sysTime) || !ds_exists(global.sysTime, ds_type_map)) {
        loadSystemTime_scr();
    } else {
        global.sysTime[? "val"] = date_current_datetime();
        var file = global.savePrefix+"sysTime"+global.saveExt;
        ds_map_secure_save(global.sysTime, file);
    }
}

