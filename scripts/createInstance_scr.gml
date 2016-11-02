{
    //createInstance_scr(obj, ratio/x, ratio/y, tri, tri, ratio/-1, ratio/-1)
    //effectively extends stock instance_create() for responsive functionality
    
    var obj = argument0;
    var inst_x = argument1;
    var inst_y = argument2;
    var align_x = argument3; //positioned by: 0=left edge, 1=center, 2=right edge
    var align_y = argument4; //positioned by: 0=top edge, 1=center, 2=bottom edge
    var scale_x = argument5; //ideal ratio
    var scale_y = argument6; //ideal ratio
    
    
    //instantiation
    var instance = instance_create(0,0,obj);
    instance.align_x = align_x; //adding x/y alignment to instance for if changes are to be made later
    instance.align_y = align_y;
    
    //base width/height
    instance.width = sprite_get_width(instance.sprite_index);
    instance.height = sprite_get_height(instance.sprite_index);
    
    //scale
    if (scale_y > 0 || scale_x > 0) {
        if (scale_x > 0) {//independent x
            instance.scale_x = scale_x*global.roomWidth / instance.width;
        }
        if (scale_y > 0) {//independent y
            instance.scale_y = scale_y*global.roomHeight / instance.height;
            if (scale_x <= 0) {//dependent x
                instance.scale_x = instance.scale_y;
            }
        } else {//dependent y
            instance.scale_y = instance.scale_x;
        }
    } else {
        instance.scale_y = 1;
        instance.scale_x = 1;
    }
    
    //positioning
    if (align_x != 0 && align_x != 1 && align_x != 2) {
        align_x = 0;
        show_debug_message("align defaulted");
    }
    if (align_y != 0 && align_y != 1 && align_y != 2) {
        align_y = 0;
        show_debug_message("align defaulted");
    }
    //confirming x/y inputs are ratios, else applying values as absolutes
    if (0 < inst_x && 1 >= inst_x) {
        inst_x = inst_x*global.roomWidth;
    }
    instance.x = inst_x - (align_x/2)*instance.width*instance.scale_x;
    if (0 < inst_y && 1 >= inst_y) {
        inst_y = inst_y*global.roomHeight;
    }
    instance.y = inst_y - (align_y/2)*instance.height*instance.scale_y;
    
    return instance;
}

