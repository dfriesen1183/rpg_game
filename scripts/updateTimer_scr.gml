{
    global.cwestCloc.textObj.text = global.record[? "duration"] - global.record[? "time"];
    
    var cloc = global.cwestCloc;
    draw_set_font(cloc.textObj.font);
    cloc.width = string_width(cloc.textObj.text);
    cloc.width += ds_list_find_value(global.clockFormat[? "inMarg"], 0) + ds_list_find_value(global.clockFormat[? "inMarg"], 1)
        cloc.textObj.width = cloc.width;
    cloc.scale_x = cloc.width/global.roomWidth;
    
    moveInstance_scr(global.cwestCloc, 0.5,cloc.y, 1,2, cloc.scale_x,cloc.scale_y);
}

