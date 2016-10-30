{
    //genPotentialIndex_tileset1_scr();
    //(called from bgTileSpawner_obj)
    //prepares <tileset1> reference data for procedural generation of backgrounds during quest

    global.tileRow = 7;
    
    //preparing group holders
    global.tileGroup = ds_map_create();
    ds_map_add_list(global.tileGroup, "left", ds_list_create());
    ds_map_add_list(global.tileGroup, "right", ds_list_create());
    ds_map_add_list(global.tileGroup, "up", ds_list_create());
    ds_map_add_list(global.tileGroup, "down", ds_list_create());
    
    var key = ds_map_find_first(global.tileGroup);
    for (var i=0; i<4; i++) {
        show_debug_message(key);
        for (var j=0; j<4; j++) {
            show_debug_message(j);
            ds_list_add_list(global.tileGroup[? key], ds_list_create());
        }
        key = ds_map_find_next(global.tileGroup, key);
    }
    
    //defining complementary pairs (retroactively placed here)
    global.conGroup = ds_map_create();
    ds_map_add_list(global.conGroup, "left", ds_list_create());
    var left = global.conGroup[? "left"];
        left[| 0] = 1;
        left[| 1] = 0;
        left[| 2] = 2;
        left[| 3] = 3;
    ds_map_add_list(global.conGroup, "right", ds_list_create());
    var right = global.conGroup[? "right"];
        right[| 0] = 1;
        right[| 1] = 0;
        right[| 2] = 2;
        right[| 3] = 3;
    ds_map_add_list(global.conGroup, "up", ds_list_create());
    var up = global.conGroup[? "up"];
        up[| 0] = 3;
        up[| 1] = 0;
        up[| 2] = 1;
        up[| 3] = 2;
    ds_map_add_list(global.conGroup, "down", ds_list_create());
    var down = global.conGroup[? "down"];
        down[| 0] = 1;
        down[| 1] = 2;
        down[| 2] = 3;
        down[| 3] = 0;
    
    
    //preparing index with references to groups
    global.tileIndex = ds_grid_create(global.tileRow, global.tileRow);
    
    genPotentialIndexItem_scr(0,0, 0,0,0,0);
    genPotentialIndexItem_scr(1,0, 1,0,0,1);
    genPotentialIndexItem_scr(2,0, 1,0,0,1);
    genPotentialIndexItem_scr(3,0, 1,0,0,1);
    genPotentialIndexItem_scr(4,0, 1,0,0,1);
    genPotentialIndexItem_scr(5,0, 1,1,0,2);
    genPotentialIndexItem_scr(6,0, 0,1,0,3);

    genPotentialIndexItem_scr(0,1, 0,2,1,0);
    genPotentialIndexItem_scr(1,1, 2,3,2,2);
    genPotentialIndexItem_scr(2,1, 3,2,2,0);
    genPotentialIndexItem_scr(3,1, 2,2,2,1);
    genPotentialIndexItem_scr(4,1, 2,2,2,1);
    genPotentialIndexItem_scr(5,1, 2,1,3,2);
    genPotentialIndexItem_scr(6,1, 0,1,0,3);

    genPotentialIndexItem_scr(0,2, 0,2,1,0);
    genPotentialIndexItem_scr(1,2, 2,0,3,1);
    genPotentialIndexItem_scr(2,2, 1,2,1,1);
    genPotentialIndexItem_scr(3,2, 2,2,2,1);
    genPotentialIndexItem_scr(4,2, 2,2,2,1);
    genPotentialIndexItem_scr(5,2, 2,1,3,2);
    genPotentialIndexItem_scr(6,2, 0,1,0,3);

    genPotentialIndexItem_scr(0,3, 0,2,1,0);
    genPotentialIndexItem_scr(1,3, 1,3,1,2);
    genPotentialIndexItem_scr(2,3, 3,0,3,0);
    genPotentialIndexItem_scr(3,3, 2,2,2,1);
    genPotentialIndexItem_scr(4,3, 2,2,2,1);
    genPotentialIndexItem_scr(5,3, 2,1,3,2);
    genPotentialIndexItem_scr(6,3, 0,1,0,3);

    genPotentialIndexItem_scr(0,4, 0,2,1,0);
    genPotentialIndexItem_scr(1,4, 3,0,3,0);
    genPotentialIndexItem_scr(2,4, 1,3,1,2);
    genPotentialIndexItem_scr(3,4, 2,2,2,1);
    genPotentialIndexItem_scr(4,4, 2,2,2,1);
    genPotentialIndexItem_scr(5,4, 2,1,3,2);
    genPotentialIndexItem_scr(6,4, 0,1,0,3);

    genPotentialIndexItem_scr(0,5, 0,3,1,3);
    genPotentialIndexItem_scr(1,5, 3,3,2,3);
    genPotentialIndexItem_scr(2,5, 3,3,2,3);
    genPotentialIndexItem_scr(3,5, 3,3,2,3);
    genPotentialIndexItem_scr(4,5, 3,3,2,3);
    genPotentialIndexItem_scr(5,5, 3,1,3,3);
    genPotentialIndexItem_scr(6,5, 0,1,0,3);

    genPotentialIndexItem_scr(6,6, 0,1,0,3);

    //filling relevant groups with references back to index
    var width = ds_grid_width(global.tileIndex);
    var height = ds_grid_height(global.tileIndex) - 1;
    for (var i=0; i<width; i++) {
        for (var j=0; j<height; j++) {
            var map = ds_grid_get(global.tileIndex, i, j);
            var key = ds_map_find_first(map);
            var size = ds_map_size(map);
            for (var k=0; k<size; k++) {
                var group = ds_map_find_value(map, key);
                var tilePos = ds_list_create();
                tilePos[| 0] = i;
                tilePos[| 1] = j;
                ds_list_add_list(ds_list_find_value(global.tileGroup[? key], group), tilePos);
                key = ds_map_find_next(map, key);
            }
        }
    }
    
    /*show_debug_message("");
    var data = ds_map_create();
    ds_map_add_list(data, "up", global.tileGroup[? "up"]);
    output = json_encode(data);
    show_debug_message(output);
    ds_map_delete(data, "up");
    ds_map_destroy(data);*/

}

