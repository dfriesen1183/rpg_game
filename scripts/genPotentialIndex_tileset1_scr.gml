{
    global.tileRow = 7;
    //global.tileCol = 7;
    global.tileIndex = ds_list_create();
    global.tileGroup = ds_map_create();
    global.tileGroup[? "left"] = ds_list_create();
    global.tileGroup[? "right"] = ds_list_create();
    global.tileGroup[? "up"] = ds_list_create();
    global.tileGroup[? "down"] = ds_list_create();
    var key = ds_map_find_first(global.tileGroup);
    for (var i=0; i<4; i++) {
        for (var j=0; j<4; j++) {
            ds_list_add_list(global.tileGroup[? key], ds_list_create());
        }
        key = ds_map_find_next(global.tileGroup, key);
    }
    global.tileGroup[? "convert"] = ds_li
    
    //up groups
    var list = ds_list_find_value(global.tileGroup[? "up"], 0);
        for (var i=0; i<7; i++) {
            ds_list_add(genTileRef_scr(i,0));
        }
        for (var i=0; i<6; i++) {
            ds_list_add(genTileRef_scr(6,i));
        }
        ds_list_add(genTileRef_scr(0,6));
    list = ds_list_find_value(global.tileGroup[? "up"], 1);
        for (var i=1; i<6; i++) {
            ds_list_add(genTileRef_scr(0,i));
        }
        ds_list_add(genTileRef_scr(2,2));
        ds_list_add(genTileRef_scr(1,3));
        ds_list_add(genTileRef_scr(2,4));
    list = ds_list_find_value(global.tileGroup[? "up"], 2);
        for (var i=1; i<3; i++) {
            ds_list_add(genTileRef_scr(i,1));
        }
        for (var i=1; i<3; i++) {
            ds_list_add(genTileRef_scr(i,5));
        }
        for (var i=1; i<6; i++) {
            ds_list_add(genTileRef_scr(3,i));
        }
        for (var i=1; i<6; i++) {
            ds_list_add(genTileRef_scr(4,i));
        }
    list = ds_list_find_value(global.tileGroup[? "up"], 3);
        for (var i=1; i<6; i++) {
            ds_list_add(genTileRef_scr(5,i));
        }
        ds_list_add(genTileRef_scr(1,2));
        ds_list_add(genTileRef_scr(2,3));
        ds_list_add(genTileRef_scr(1,4));

    //left groups
    list = ds_list_find_value(global.tileGroup[? "left"], 0);
        for (var i=1; i<6; i++) {
            ds_list_add(genTileRef_scr(i,0));
        }
        ds_list_add(genTileRef_scr(2,2));
        ds_list_add(genTileRef_scr(1,3));
        ds_list_add(genTileRef_scr(2,4));
    list = ds_list_find_value(global.tileGroup[? "left"], 1);
        for (var i=0; i<7; i++) {
            ds_list_add(genTileRef_scr(0,i));
        }
        for (var i=0; i<6; i++) {
            ds_list_add(genTileRef_scr(6,i));
        }
    list = ds_list_find_value(global.tileGroup[? "left"], 2);
        for (var i=1; i<5; i++) {
            ds_list_add(genTileRef_scr(3,i));
        }
        for (var i=1; i<5; i++) {
            ds_list_add(genTileRef_scr(4,i));
        }
        for (var i=1; i<5; i++) {
            ds_list_add(genTileRef_scr(5,i));
        }
        ds_list_add(genTileRef_scr(1,1));
        ds_list_add(genTileRef_scr(1,2));
    list = ds_list_find_value(global.tileGroup[? "left"], 3);
        for (var i=1; i<6; i++) {
            ds_list_add(genTileRef_scr(i,5));
        }
        ds_list_add(genTileRef_scr(1,4));
        ds_list_add(genTileRef_scr(2,3));
        ds_list_add(genTileRef_scr(2,1));

    //down groups
    list = ds_list_find_value(global.tileGroup[? "down"], 0);
        for (var i=0; i<6; i++) {
            ds_list_add(genTileRef_scr(6,i));
        }
        for (var i=0; i<6; i++) {
            ds_list_add(genTileRef_scr(i,5));
        }
        ds_list_add(genTileRef_scr(0,6));
    list = ds_list_find_value(global.tileGroup[? "down"], 1);
        for (var i=0; i<5; i++) {
            ds_list_add(genTileRef_scr(0,i));
        }
        ds_list_add(genTileRef_scr(2,1));
        ds_list_add(genTileRef_scr(2,3));
        ds_list_add(genTileRef_scr(1,4));
    list = ds_list_find_value(global.tileGroup[? "down"], 2);
        for (var i=0; i<5; i++) {
            ds_list_add(genTileRef_scr(3,i));
        }
        for (var i=0; i<5; i++) {
            ds_list_add(genTileRef_scr(4,i));
        }
        ds_list_add(genTileRef_scr(1,0));
        ds_list_add(genTileRef_scr(2,0));
        ds_list_add(genTileRef_scr(1,2));
        ds_list_add(genTileRef_scr(2,2));
    list = ds_list_find_value(global.tileGroup[? "down"], 3);
        for (var i=0; i<5; i++) {
            ds_list_add(genTileRef_scr(5,i));
        }
        ds_list_add(genTileRef_scr(2,4));
        ds_list_add(genTileRef_scr(1,3));
        ds_list_add(genTileRef_scr(1,1));

    //right groups
    list = ds_list_find_value(global.tileGroup[? "right"], 0);
        for (var i=0; i<5; i++) {
            ds_list_add(genTileRef_scr(0,i));
        }
        ds_list_add(genTileRef_scr(1,2));
        ds_list_add(genTileRef_scr(2,3));
        ds_list_add(genTileRef_scr(1,4));
    list = ds_list_find_value(global.tileGroup[? "right"], 1);
        for (var i=0; i<6; i++) {
            ds_list_add(genTileRef_scr(5,i));
        }
        for (var i=0; i<6; i++) {
            ds_list_add(genTileRef_scr(6,i));
        }
        ds_list_add(genTileRef_scr(0,6));
    list = ds_list_find_value(global.tileGroup[? "right"], 2);
        for (var i=1; i<5; i++) {
            ds_list_add(genTileRef_scr(0,i));
        }
        for (var i=1; i<5; i++) {
            ds_list_add(genTileRef_scr(3,i));
        }
        for (var i=1; i<5; i++) {
            ds_list_add(genTileRef_scr(4,i));
        }
        ds_list_add(genTileRef_scr(2,1));
        ds_list_add(genTileRef_scr(2,2));
    list = ds_list_find_value(global.tileGroup[? "right"], 3);
        for (var i=0; i<5; i++) {
            ds_list_add(genTileRef_scr(i,5));
        }
        ds_list_add(genTileRef_scr(1,1));
        ds_list_add(genTileRef_scr(1,3));
        ds_list_add(genTileRef_scr(2,4));
}

