{
    var instance = argument0;
    var inst_x = argument1;
    var inst_y = argument2;
    var align_x = argument3;
    var align_y = argument4;
    var scale_x = argument5;
    var scale_y = argument6;
    
    //scale
    if (0 < scale_y || 0 < scale_x) {
        if (0 < scale_x) {//independent x
            instance.scale_x = scale_x*global.roomWidth / instance.width;
        }
        if (0 < scale_y) {//independent y
            instance.scale_y = scale_y*global.roomHeight / instance.height;
            if (0 >= scale_x) {//dependent x
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
    if (0 != align_x && 1 != align_x && 2 != align_x) {
        align_x = 0;
        show_debug_message("align defaulted x");
    }
    if (0 != align_y && 1 != align_y && 2 != align_y) {
        align_y = 0;
        show_debug_message("align defaulted y");
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

}

