{
    //createInstance_scr(obj, ratio/x, ratio/y, tri, tri, ratio/-1, ratio/-1)
    //effectively extends stock instance_create() for responsive functionality
    
    var obj = argument0;
    var inst_x = argument1;
    var inst_y = argument2;
    var align_x = argument3; //positioned by: 0=left edge, 1=center, 2=right edge
    var align_y = argument4; //positioned by: 0=top edge, 1=center, 2=bottom edge
    var scale_x = argument5; //'ideal' ratio
    var scale_y = argument6; //'ideal' ratio
    
    
    //instantiation
    var instance = instance_create(0,0,obj);
    instance.align_x = align_x; //adding x/y alignment to instance for if changes are to be made later
    instance.align_y = align_y;
    
    //base width/height
    instance.width = sprite_get_width(instance.sprite_index);
    instance.height = sprite_get_height(instance.sprite_index);
    
    moveInstance_scr(instance, inst_x,inst_y, align_x,align_y, scale_x,scale_y);    
    
    return instance;
}

