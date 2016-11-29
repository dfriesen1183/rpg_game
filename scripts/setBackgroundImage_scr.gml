{
    var image = argument0;
    
    if (0 >= instance_number(backImage_obj)) {
        global.backImage = instance_create(0,0,backImage_obj);
    }
    
    var back = global.backImage;
    back.sprite_index = image;
        
    back.align_x = 0;
    back.lign_y = 0;
    back.width = sprite_get_width(image);
    back.height = sprite_get_height(image);
    
    var scale_x, scale_y;
    var imgRatio = back.width/back.height;
    var devRatio = global.roomWidth/global.roomHeight;
    if (devRatio > imgRatio) {
        scale_x = 1;
        scale_y = -1;
    } else {
        scale_x = -1;
        scale_y = 1;
    }
    moveInstance_scr(back, 0.5,0.5, 1,1, scale_x,scale_y);
}

