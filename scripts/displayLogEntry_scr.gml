{
    var text = argument0;
    show_debug_message(text);
    
    if (0 < instance_number(questLog_obj)) {
    
        
        var log = global.questLog;
        text = string_upper(text);
    
        var logWidth = log.width*log.scale_x/global.roomWidth;
        var _width = logWidth - (log.margin[| 0] + log.margin[| 1]);
        draw_set_font(log.font);
        var _height = string_height_ext(text, -1, _width*global.roomWidth)/global.roomHeight;
        
        var logHeight = _height + log.margin[| 2] + log.margin[| 3];
        var log_y = 1 - (logHeight + log.susp_y);
        moveInstance_scr(log, log.x,log_y, 0,0, logWidth,logHeight);
        
        var text_x = log.x + log.margin[| 0]*global.roomWidth;
        var text_y = log_y + log.margin[| 2];
        var entry = createInstance_scr(questLogEntry_obj, text_x,text_y, 0,0, _width,_height);
        entry.text = text;
        entry.font = log.font;
        
        //clearing text
        var size = ds_list_size(log.text);
        for (var i=size - 1; i>=0; i--) {
            with (log.text[| i]) {
                instance_destroy();
            }
            ds_list_delete(log.text, i);
        }
        
        ds_list_add(log.text, entry);
        
        
    }
}

