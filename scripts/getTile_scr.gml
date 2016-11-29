{
    //getTile_scr(index_x);
    
    var index = argument0;
    
    var tile;
    
    var leftGroup = -1;
    var size = ds_list_size(id.currentRow);
    if (size) {
        size--;
        var tile = id.currentRow[| size];
        var tile_x = tile[| 0];
        var tile_y = tile[| 1];
        
        var tileMap = global.tileIndex[# tile_x, tile_y];
        leftGroup = tileMap[? "right"];
        leftGroup = ds_list_find_value(global.conGroup[? "right"], leftGroup);
    }
    var downGroup = -1;
    size = ds_list_size(id.lastRow);
    if (size) {
        var tile = id.lastRow[| index];
        var tile_x = tile[| 0];
        var tile_y = tile[| 1];
        var tileMap = global.tileIndex[# tile_x, tile_y];
        downGroup = tileMap[? "up"];
        downGroup = ds_list_find_value(global.conGroup[? "up"], downGroup);
    }
    
    if (downGroup < 0 && leftGroup < 0) {
        tile = ds_list_create();
        tile[| 0] = 0;
        tile[| 1] = 0;
    } else {
        if (downGroup >= 0) {
            var candList = ds_list_create();
            var groupMap = global.tileGroup[? "down"];
            var groupList = groupMap[| downGroup];
            ds_list_copy(candList, groupList);
            
            if (leftGroup >= 0) {
                size = ds_list_size(candList);
                for (var i=0; i<size; i++) {
                    var candidate = candList[| i];
                    var cand_x = candidate[| 0];
                    var cand_y = candidate[| 1];
                    var candMap = global.tileIndex[# cand_x, cand_y];
                    var candGroup = candMap[? "left"];
                    if (candGroup != leftGroup) {
                        ds_list_delete(candList, i);
                        size--;
                        i--;
                    }
                }
            }
        } else {
            var candList = ds_list_create();
            var groupLeft = global.tileGroup[? "left"];
            var groupList = groupLeft[| leftGroup];
            ds_list_copy(candList, groupList);
        }
        
        //choose candidate
        tile = ds_list_create();
        var rangeEnd = ds_list_size(candList) - 1;
        if (rangeEnd >= 0) {
            var tileIndex = irandom_range(0,rangeEnd);
            var chosen = candList[| tileIndex];
            ds_list_copy(tile, chosen);
        } else {
            show_debug_message("all tiles unfit");
            tile[| 0] = 0;
            tile[| 1] = 0;
        }
    }
    
    return tile;
}

