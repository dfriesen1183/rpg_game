{
    var left = argument0;
    var right = argument1;
    var up = argument2;
    var down = argument3;
    
    var indexMap = ds_map_create();
    ds_map_add(indexMap, "left", left);
    ds_map_add(indexMap, "right", right);
    ds_map_add(indexMap, "up", up);
    ds_map_add(indexMap, "down", down);
    
    ds_list_add_map(global.tileIndex, indexMap);
}

