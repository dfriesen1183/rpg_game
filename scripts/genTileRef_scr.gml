{
    //genTileRef_scr(x, y)
    //derives and returns linear index from 2d array

    var tile_x = argument0;
    var tile_y = argument1;
    
    return tile_y*global.tileRow + tile_x;
}

