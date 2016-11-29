{
    with(guildHeroBtn_obj) {
        instance_destroy();
    }

    var size = ds_list_size(global.heroes);
    for (var i=global.heroPageStart; i<global.heroPageStart + global.heroPageLimit && i<size; i++) {
        var hero = global.heroes[| i];
        var heroButton_y = (2 + 2.5*(i - global.heroPageStart))/16;
        var heroButton = createInstance_scr(guildHeroBtn_obj, 1/9,heroButton_y, 0,0, 7/9,2/16);
        heroButton.index = i;
        heroButton.heroId = hero[? "id"];
        if (0 <= hero[? "questIndex"]) {
            heroButton.image_index = global.btnStateDisabled;        
        }
        displayGuildHero_scr(heroButton);
    }
    
    with (guildHeroBtn_obj) {
        var partySize = ds_list_size(global.party);
        for (var i=0; i<partySize; i++) {
            var member = ds_list_find_value(global.party, i);
            var memberIndex = ds_map_find_value(member, "id");
            if (id.heroId == memberIndex) {
                id.active = true;
                id.image_index = global.btnStateActive;
                break;
            }
        }
    }
    
    //updating relevant interface
    if (0 < global.heroPageStart) {
        with(heroPageBtnPrev_obj){
            id.image_index = global.btnStateUp;
        }
    } else {
        with(heroPageBtnPrev_obj){
            id.image_index = global.btnStateDisabled;
        }
    }
    if (size - 1 > global.heroPageStart + global.heroPageLimit) {
        with(heroPageBtnNext_obj){
            id.image_index = global.btnStateUp;
        }
    } else {
        with(heroPageBtnNext_obj){
            id.image_index = global.btnStateDisabled;
        }
    }
}

