{
    var text = argument0;
    show_debug_message(text);
    
    if (0 < instance_number(logBounding_obj)) {
    
        
        var log = global.logObj;    
    
        var _width = log.width*log.scale_x - (log.margin[| 0] + log.margin[| 1]);
        draw_set_font(log.font);
        var _height = string_height_ext(text, -1, _width*global.roomWidth);
        
        log.height = _height + log.margin[| 2] + log.margin[| 3];
        log.y = global.roomHeight - (_height + log.susp_y + log.margin[| 2] + log.margin[| 3]);
        
        var text_x = log.x + log.margin[| 0];
        var text_y = log.y + log.margin[| 2];
        var textObj = createInstance_scr(text_obj, text_x,text_y, 0,0, _width,_height);
        textObj.text = text;
        
        //clearing text
        var size = ds_list_size(log.text);
        for (var i=size - 1; i>=0; i--) {
            with (log.text[| i]) {
                instance_destroy();
            }
            ds_list_delete(log.text, i);
        }
        
        ds_list_add(log.text, textObj);
        
        
    }
}

