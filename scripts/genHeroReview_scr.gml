{
    var list = argument0;
    var offset = argument1;
    show_debug_message(offset);
    
    var numPerRow = 6;
    var margLeft = 0.1;
    var totalSepPerRow = 0.1;
    var width = (1 - margLeft*2 - totalSepPerRow)/numPerRow;
    var sep = totalSepPerRow/(numPerRow - 1);
    
    
    var size = ds_list_size(list);
    for (var i=0; i<size; i++) {
        var new_x = margLeft + i%numPerRow*(width + sep)
        var new_y = offset + floor(i/numPerRow)*(width + sep)*global.roomHeight;
        var hero = createInstance_scr(heroButton_obj, new_x,new_y, 0,0, width,-1);
        hero.image_index = global.btnStateStatic;
        hero.index = ds_map_find_value(list[| i], "index");
        displayGuildHero_scr(hero);
    }
    
    var rowCount = (size - 1)%numPerRow + 1;
    show_debug_message(rowCount);
    var add = 0;
    if (rowCount) {
        add = width*rowCount;
        if (rowCount > 1) {
            add += sep*(rowCount - 1);
            show_debug_message("separated");
        }
        add *= global.roomWidth;
    }
    show_debug_message(offset);
    offset += add;
    show_debug_message(offset);
    return offset;
}

