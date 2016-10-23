{
    //quest_code_scr()
    //(called from quest_room creation code)
    //readies quest board

    //readying party
    var size = ds_list_size(global.party);
    for (var i=0; i<size; i++) {
        var hero = ds_list_find_value(global.party, i);
        if (is_undefined(ds_map_find_value(hero, "partyIndex"))) {
            ds_map_add(hero, "partyIndex", i);
        } else {
            ds_map_replace(hero, "partyIndex", i);
        }

        var index = ds_map_find_value(hero, "index");
        displayPartyMember_scr(index, i, false);
    }
    
    //readying log
    var outerMarg = 5;
    var innerMarg_x = 20;
    var innerMarg_y = 5;
    global.logBounding = instance_create(outerMarg,850,logBounding_obj);
    
    global.logFormat = ds_map_create();
        ds_map_add(global.logFormat, "outMarg", outerMarg);
        ds_map_add(global.logFormat, "inMarg_x", innerMarg_x);
        ds_map_add(global.logFormat, "inMarg_y", innerMarg_y);
        ds_map_add(global.logFormat, "offset", global.logBounding.y);
        ds_map_add(global.logFormat, "innerHeight", global.logBounding.height - 2*innerMarg_y);
        ds_map_add(global.logFormat, "font", simplePixelsMed);
        ds_map_add(global.logFormat, "width", global.logBounding.width - innerMarg_x*2);

    var index = 0;
    var width = ds_map_find_value(global.logFormat, "width");
    var heightTotal = 0;
    var boundingInnerHeight = ds_map_find_value(global.logFormat, "innerHeight");

    draw_set_font(ds_map_find_value(global.logFormat, "font"));
    size = ds_list_size(global.logText);
    for (; index<size; index++) {
        var text = ds_list_find_value(global.logText, index);
        var height = string_height_ext(text, -1, width);

        heightTotal += height;
        if (heightTotal > boundingInnerHeight) {
            break;
        }
    }
    for (var i=index-1; i>=0; i--) {
        var text = ds_list_find_value(global.logText, i);
        displayLogEntry_scr(text);
    }
    draw_set_font(-1);
    
    //initiating quest cycle
    if (size == 0) {
        var durHuman = string(ds_map_find_value(global.record, "duration")/60);
        var msg = "Embarked on "+durHuman+"m quest";
        genLogEntry_scr(msg);
        show_debug_message(msg);
    }
    questLogic_scr();
}

