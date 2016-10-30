{
    var index_x = argument0;
    var index_y = argument1;

    var left = argument2;
    var right = argument3;
    var up = argument4;
    var down = argument5;
    
    var indexMap = ds_map_create();
    ds_map_add(indexMap, "left", left);
    ds_map_add(indexMap, "right", right);
    ds_map_add(indexMap, "up", up);
    ds_map_add(indexMap, "down", down);
    
    ds_grid_add(global.tileIndex, index_x, index_y, indexMap);
}

