{
    //questReview_code_scr()
    //(called from questReview_room creation code)
    //displays quest result

    saveGame_scr();
    
    //deleting heroes displayed
    with(hero_obj) {
        instance_destroy();
    }

    /*show_debug_message("Result:");
    show_debug_message("Party:");

    //generating log items for each party member
    var size = ds_list_size(global.party);
    var partyDefeated = true;

    for (var i=0; i<size; i++) {
        var hero = ds_list_find_value(global.party, i);
        var name = ds_map_find_value(hero,"name");
        var level = ds_map_find_value(hero,"level");
        var hp = ds_map_find_value(hero,"hp");
        var maxHp = ds_map_find_value(hero,"maxHp");
        var index = ds_map_find_value(hero,"index");

        var store = 0;
        var storeIndex = 0;
        var heroCount = ds_list_size(global.heroes);
        for (var j=0; j<heroCount; j++) {
            store = ds_list_find_value(global.heroes, j);
            if (ds_map_find_value(store, "index") == index) {
                storeIndex = j;
                break;
            }
        }

        if (ds_map_find_value(hero, "found")) {
            ds_map_delete(store, "found");
            show_debug_message("Found "+name+", level "+string(level)+" Hero at "+string(maxHp)+"hp");
        }
        if (hp < maxHp) {
            if (hp > 0) {
                partyDefeated = false;
                show_debug_message(name+" was wounded to "+string(hp)+"/"+string(maxHp));
            } else {
                show_debug_message(name+" fell in battle");
                ds_map_destroy(store);
                ds_list_delete(global.heroes, storeIndex);
            }
        }
    }
    if (!partyDefeated) {
        show_debug_message("Party successfully completed the quest!");
    }*/
    
    //updating guild data
    var newGold = ds_map_find_value(global.guild,"gold") + ds_map_find_value(global.record, "gold");
    ds_map_replace(global.guild, "gold", newGold);
    
    var reviewFont = simplePixels24;
    var margTop = 0.15*global.roomHeight;
    var margLeft = 0.1*global.roomWidth;
    var _width = global.roomWidth - 2*margLeft;
    var sep = 0.01*global.roomHeight;
    
    //gold
    var goldText = instance_create(margLeft,margTop,reviewText_obj);
    goldText.text = string_upper("total gold found:#   "+string(global.record[? "gold"]));
    goldText.width = _width;
    draw_set_font(goldText.font);
    goldText.height = string_height_ext(goldText.text,goldText.lineHeight,_width);
    
    //battles
    var battleText = instance_create(margLeft,goldText.y+goldText.height+sep,reviewText_obj);
    battleText.text = string_upper("total battles fought:#   "+string(ds_map_find_value(global.record, "battles")));
    battleText.width = _width;
    draw_set_font(battleText.font);
    battleText.height = string_height_ext(battleText.text,battleText.lineHeight,_width);
    
    var new_y = battleText.y + battleText.height;
    //heroes found
    var size = ds_list_size(global.heroes);
    var collected = ds_list_create();
    for (var i=0; i<size; i++) {
        if (ds_map_find_value(global.heroes[| i], "found")) {
            ds_list_add(collected, global.heroes[| i]);
            ds_map_delete(global.heroes[| i], "found");
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
    size = ds_list_size(global.heroes);
    var collected = ds_list_create();
    for (var i=0; i<size; i++) {
        if (0 >= ds_map_find_value(global.heroes[| i], "hp")) {
            ds_list_add(collected, global.heroes[| i]);
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
        
        for (var i=size-1; i>=0; i--) {
            ds_map_destroy(collected[| i]);//'killing' heroes
            ds_list_delete(collected, i);
        }
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
    setGroundState_scr();
    var main = createInstance_scr(mainMenuMain_obj, 0.5,1-margTop/global.roomHeight, 1,2, 0.3,-1);
}


















