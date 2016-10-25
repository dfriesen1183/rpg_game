{
    //displayLogEntry_scr(string);
    //displays log entry
    
    var text = argument0;
    
    var entry_x = ds_list_find_value(global.logFormat[? "outMarg"], 0) + ds_list_find_value(global.logFormat[? "inMarg"], 0);
    var entry_y = ds_list_find_value(global.logFormat[? "outMarg"], 2) + ds_list_find_value(global.logFormat[? "inMarg"], 2);
    var width = global.logFormat[? "inWidth"];
    draw_set_font(global.logFormat[? "font"]);
    var _height = string_height_ext(text, -1, width);

    with (logEntry_obj) {
        id.y += _height;
    }
    
    var lastIndex = ds_list_size(global.logObj) - 1;
    var border = room_height - ds_list_find_value(global.logFormat[? "outMarg"], 3) - ds_list_find_value(global.logFormat[? "inMarg"], 3);
    for (var i=lastIndex; i>=0; i--) {
        var entry = global.logObj[| i];
        if (ds_exists(entry, ds_type_list)) {
            if (entry.y > border) {
                with (entry) {
                    instance_destroy();
                }
                ds_list_delete(global.logObj, i);
            } else {
                break;
            }
        } else {
            ds_list_delete(global.logObj, i);
        }
    }
    
    var entry = instance_create(entry_x, entry_y, logEntry_obj);
    ds_list_insert(global.logObj, 0, entry);
    entry.width = width;
    entry.text = string_upper(text);
    entry.font = global.logFormat[? "font"];
    entry.height = _height;
}

