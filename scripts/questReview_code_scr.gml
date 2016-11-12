{
    //questReview_code_scr()
    //(called from questReview_room creation code)
    //displays quest result

    saveGame_scr();
    
    var record = global.activeQuests[| global.quest];
    var party = record[? "party"];
    
    //deleting heroes displayed
    with(hero_obj) {
        instance_destroy();
    }
    
    //updating guild data
    var newGold = ds_map_find_value(global.guild,"gold") + ds_map_find_value(record, "gold");
    ds_map_replace(global.guild, "gold", newGold);
    
    var reviewFont = simplePixels24;
    var margTop = 0.15*global.roomHeight;
    var margLeft = 0.1*global.roomWidth;
    var _width = global.roomWidth - 2*margLeft;
    var sep = 0.01*global.roomHeight;
    
    //gold
    var goldText = instance_create(margLeft,margTop,reviewText_obj);
    goldText.text = string_upper("total gold found:#   "+string(record[? "gold"]));
    goldText.width = _width;
    draw_set_font(goldText.font);
    goldText.height = string_height_ext(goldText.text,goldText.lineHeight,_width);
    
    //battles
    var battleText = instance_create(margLeft,goldText.y+goldText.height+sep,reviewText_obj);
    battleText.text = string_upper("total battles fought:#   "+string(ds_map_find_value(record, "battles")));
    battleText.width = _width;
    draw_set_font(battleText.font);
    battleText.height = string_height_ext(battleText.text,battleText.lineHeight,_width);
    
    var new_y = battleText.y + battleText.height;
    //heroes found
    var size = ds_list_size(party);
    var collected = ds_list_create();
    for (var i=0; i<size; i++) {
        var hero = party[| i];
        if (ds_map_find_value(hero, "found") == global.quest) {
            ds_list_add(collected, hero);
        }
    }
    size = ds_list_size(collected);
    if (size) {
        new_y += sep;
        var foundText = instance_create(margLeft,new_y,reviewText_obj);
        foundText.text = string_upper("Heroes met:");
        foundText.width = _width;
        draw_set_font(foundText.font);
        foundText.height = string_height_ext(foundText.text,foundText.lineHeight,_width);
        
        new_y += foundText.height + sep;
        new_y = genHeroReview_scr(collected, new_y);

        for (var i=size-1; i>=0; i--) {
            ds_list_delete(collected, i);
        }
    }
    ds_list_destroy(collected);
    
    //heroes fallen
    size = ds_list_size(party);
    var collected = ds_list_create();
    for (var i=0; i<size; i++) {
        if (0 >= ds_map_find_value(party[| i], "hp")) {
            ds_list_add(collected, party[| i]);
        }
    }
    size = ds_list_size(collected);
    if (size) {
        new_y += sep;
        var fallenText = instance_create(margLeft,new_y,reviewText_obj);
        fallenText.text = string_upper("Heroes lost:");
        fallenText.width = _width;
        draw_set_font(fallenText.font);
        fallenText.height = string_height_ext(fallenText.text,fallenText.lineHeight,_width);
        
        new_y += fallenText.height + sep;
        new_y = genHeroReview_scr(collected, new_y);
    }
    ds_list_destroy(collected);
    
    
    var border = 0.08;
    var backWidth = _width/global.roomWidth + border;
    var backHeight = (new_y - margTop + border*global.roomWidth)/global.roomHeight;
    var back_x = (1 - backWidth)/2;
    var back_y = (margTop - sep)/global.roomHeight;
    show_debug_message(string(back_x)+":"+string(back_y)+" "+string(backWidth)+":"+string(backHeight));
    var backdrop = createInstance_scr(logBounding_obj, back_x,back_y, 0,0, backWidth,backHeight);
    
    
    //reseting active variables (record, party, heroes...)
    setGroundState_scr(global.quest);
    destroyQuest_scr(global.quest);
    var main = createInstance_scr(mainMenuMain_obj, 0.5,1-margTop/global.roomHeight, 1,2, 0.3,-1);
}

