{
    //drawSprite_scr()
    //(called from object)
    //universal call for responsive implementation
    
    id.image_xscale = id.scale_x;
    id.image_yscale = id.scale_y;

    draw_sprite_stretched(id.sprite_index, id.image_index, id.x, id.y, id.width*id.scale_x, id.height*id.scale_y);
}

