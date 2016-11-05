{
    var cloc = argument0;
    
    cloc.textObj.text = secToClock_scr(global.record[? "duration"] - global.record[? "time"], 1);
    cloc.textObj.text = string_upper(cloc.textObj.text);
    
    draw_set_font(cloc.textObj.font);
    cloc.width = string_width(cloc.textObj.text);
    cloc.width += ds_list_find_value(global.clockFormat[? "inMarg"], 0) + ds_list_find_value(global.clockFormat[? "inMarg"], 1)
        cloc.textObj.width = cloc.width;
    cloc.scale_x = cloc.width/global.roomWidth;

    cloc.height = string_height(cloc.textObj.text);
    cloc.height += ds_list_find_value(global.clockFormat[? "inMarg"], 2) + ds_list_find_value(global.clockFormat[? "inMarg"], 3);
    cloc.scale_y = cloc.height/global.roomHeight;
    
    var new_y = global.roomHeight - ds_list_find_value(global.logFormat[? "outMarg"], 3);
    moveInstance_scr(cloc, 0.5,new_y, 1,2, cloc.scale_x,cloc.scale_y);
}

