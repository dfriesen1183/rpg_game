{
    //mainMenuHeroes_code_scr()
    //(called from mainMenuHeroes_room creation code)
    //loads room ui

    
    //hero objects
    var numPerRow = 3;
    var heroWidth = 0.18;
    var heroHeight = heroWidth;
    var innerMarg = 0.02;
    var colTopMarg = 0.2;
    var colLeftMarg = 0.2;
    
    var size = ds_list_size(global.heroes);
    for (var i=0; i<size; i++) {
        var heroButton_x = colLeftMarg + (heroWidth + innerMarg)*(i%numPerRow);
        var heroButton_y = colTopMarg*global.roomHeight + (heroHeight + innerMarg)*global.roomWidth*floor(i/numPerRow);
        var heroButton = createInstance_scr(heroButton_obj, heroButton_x,heroButton_y, 0,0, heroWidth,-1);
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
                self.image_index = global.btnStateActive;
            }
        }
    }
    
    //menu objects
    var main = createInstance_scr(mainMenuMain_obj, 0.475,0.75, 2,0, 0.2,-1);
    var heroes = createInstance_scr(mainMenuQuests_obj, 0.525,0.75, 0,0, 0.2,-1);
    var depart = createInstance_scr(mainMenuBegin_obj, 0.5,0.825, 1,0, 0.2,-1);
}

