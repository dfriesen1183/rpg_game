{
    //displayLogEntry_scr(string);
    //displays log entry
    
    var text = argument0;
    
    var entry_x = ds_map_find_value(global.logFormat, "outMarg") + ds_map_find_value(global.logFormat, "inMarg_x");
    var entry_y = ds_map_find_value(global.logFormat, "offset") + ds_map_find_value(global.logFormat, "inMarg_y");
    var width = ds_map_find_value(global.logFormat, "width");
    draw_set_font(ds_map_find_value(global.logFormat, "font"));
    var _height = string_height_ext(text, -1, width);

    with (logEntry_obj) {
        id.y += _height;
    }
    
    var lastIndex = ds_list_size(global.logObj) - 1;
    if (lastIndex >= 0) {
        var lastEntry = ds_list_find_value(global.logObj, lastIndex);
        var border = room_height - ds_map_find_value(global.logFormat, "outMarg") - ds_map_find_value(global.logFormat, "inMarg_y");
        if (lastEntry.y + lastEntry.height > border) {
            with (lastEntry) {
                instance_destroy();
            }
            ds_list_delete(global.logObj, lastIndex);
        }
    }
    
    var entry = instance_create(entry_x, entry_y, logEntry_obj);
    ds_list_insert(global.logObj, 0, entry);
    entry.width = width;
    entry.text = string_upper(text);
    entry.font = ds_map_find_value(global.logFormat, "font");
    entry.height = _height;
}

