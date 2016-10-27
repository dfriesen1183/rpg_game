{
    //mainMenuHeroes_code_scr()
    //(called from mainMenuHeroes_room creation code)
    //loads room ui

    //hero objects
    var numPerRow = 3;
    var heroWidth = 100;
    var heroHeight = heroWidth;
    var innerMarg = 30;
    var colTopMarg = 500;
    var colLeftMarg = (room_width - (heroWidth*numPerRow + innerMarg*(numPerRow - 1)))/2;
    
    var size = ds_list_size(global.heroes);
    for (var i=0; i<size; i++) {
        var heroButton_x = colLeftMarg + (heroWidth + innerMarg)*(i%numPerRow);
        var heroButton_y = colTopMarg + (heroHeight + innerMarg)*floor(i/numPerRow);
        var heroButton = instance_create(heroButton_x, heroButton_y, heroButton_obj);
        heroButton.index = i;
        displayGuildHero_scr(heroButton);
    }
    size = ds_list_size(global.party);
    for (var i=0; i<size; i++) {
        var member = ds_list_find_value(global.party, i);
        var memberIndex = ds_map_find_value(member, "index");
        with (heroButton_obj) {
            if (self.index == memberIndex) {
                self.active = true;
                self.sprite_index = heroButtonTempActive_spr;
            }
        }
    }
    
    //menu objects
    instance_create(200, 800, mainMenuMain_obj);
    if (0 < ds_map_find_value(global.record, "duration")) {
        instance_create(350, 800, mainMenuBegin_obj);
    } else {
        instance_create(350, 800, mainMenuQuests_obj);
    }
}

