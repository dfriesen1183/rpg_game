{
    //displayLogEntry_scr(string);
    //displays log entry
    
    var text = string_upper(argument0);
    var add = argument1;
    
    var entry_x = ds_list_find_value(global.logFormat[? "outMarg"], 0) + ds_list_find_value(global.logFormat[? "inMarg"], 0);
    var totalInMarg = ds_list_find_value(global.logFormat[? "inMarg"], 0) + ds_list_find_value(global.logFormat[? "inMarg"], 1);
    var totalOutMarg = ds_list_find_value(global.logFormat[? "outMarg"], 0) + ds_list_find_value(global.logFormat[? "outMarg"], 1);
    var _width = room_width - (totalInMarg + totalOutMarg);// - ;//*7/8;
    draw_set_font(global.logFormat[? "font"]);
    var _height = string_height_ext(text, -1, _width);
    
    /*var lastIndex = ds_list_size(global.logObj) - 1;
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
    }*/
    
    if (false == add) {
        with (logEntry_obj) {
            instance_destroy();
        }
        global.logBounding.height = ds_list_find_value(global.logFormat[? "inMarg"], 2) + ds_list_find_value(global.logFormat[? "inMarg"], 3);
        global.logBounding.y = room_height - (global.logBounding.height + ds_list_find_value(global.logFormat[? "outMarg"], 3));
    }
    var entry = instance_create(entry_x, 0, logEntry_obj);
    ds_list_add(global.logObj, entry);
    entry.width = _width;
    entry.height = _height;
    entry.text = text;
    if (add) {
        with (logEntry_obj) {
            id.y -= entry.height;
        }
    }
    global.logBounding.y -= _height;
    global.logBounding.height += _height;
    
    var new_y = room_height - (ds_list_find_value(global.logFormat[? "outMarg"], 3) + ds_list_find_value(global.logFormat[? "inMarg"], 3) + _height);
    entry.y = new_y;
    show_debug_message(new_y);
}


