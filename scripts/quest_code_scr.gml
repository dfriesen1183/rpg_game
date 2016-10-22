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
    global.logBounding = instance_create(outerMarg,850,logBounding_obj);
    var innerMargX = 20;
    var innerMargY = 5;

    var boundingOffset = global.logBounding.y;
    var boundingHeight = room_height - global.logBounding.height;
    var heightTotal = 0;
    var entryWidth = global.logBounding.width - innerMargX*2;
    var entryFont = simplePixelsMed;
    
    draw_set_font(entryFont);
    size = ds_list_size(global.logText);
    for (var i=0; i<size; i++) {
        var entry = instance_create(outerMarg + innerMargX, boundingOffset + innerMargY + heightTotal, logEntry_obj);
        entry.width = entryWidth;
        entry.text = ds_list_find_value(global.logText, i);
        entry.font = entryFont;
        entry.height = string_height_ext(entry.text, -1, entry.width);
        
        heightTotal += entry.height;
        if (heightTotal > boundingHeight) {
            with (entry) {
                instance_destroy();
            }
            break;
        } else {
            ds_list_add(global.logObj, entry);
        }
    }
    draw_set_font(-1);
    
    //initiating quest cycle
    questLogic_scr();
}

