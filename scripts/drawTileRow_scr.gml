{
    //drawTileRow_scr(y)
    //generates row of tiles at given y coordinate, from left to right
    
    var tile_y = argument0;
    
    var drawSize = id.size*id.scale;
    var tileCount = ceil(room_width/drawSize);
    
    for (var i=0; i<tileCount; i++) {
        var tileRef = getTile_scr(i);
        ds_list_add_list(id.currentRow, tileRef);
        
        var tile_x = drawSize*i;
        var tile = tile_add(id.tileset, tileRef[| 0]*id.size, tileRef[| 1]*id.size, id.size, id.size, tile_x, tile_y, 1);
        tile_set_scale(tile, id.scale, id.scale);
    }
    
    //reset references
    var size = ds_list_size(id.lastRow);
    for (var j=size-1; j>=0; j--) {
        ds_list_destroy(id.lastRow[| j]);
    }
    ds_list_destroy(id.lastRow);

    id.lastRow = id.currentRow;
    id.currentRow = ds_list_create();
}

