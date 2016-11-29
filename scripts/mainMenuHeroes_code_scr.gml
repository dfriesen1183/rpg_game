{
    //mainMenuHeroes_code_scr()
    //(called from mainMenuHeroes_room creation code)
    //loads room ui

    
    var title = createInstance_scr(titleText_obj, 1/2,1.5/16, 0,0, 1,1/16);
    title.font = simplePixels32;
    title.textColor = c_lime;
    title.text = "Hire your HEROES ("+string(ds_list_size(global.party))+"/4)";
    
    //menu objects
    var main = createInstance_scr(mainMenuMain_obj, 0,12.5/16, 0,0, 2/9,1.5/16);
    setBtnFontLarge_scr(main);
    main.text = "BACK";
    var quests = createInstance_scr(mainMenuQuests_obj, 1,12.5/16, 2,0, 2/9,1.5/16);
    setBtnFontLarge_scr(quests);
    quests.text = "NEXT";
    //var depart = createInstance_scr(mainMenuBegin_obj, 0.5,0.825, 1,0, 0.2,-1);

    displayPartyDock_scr();
    
    //hero objects
    var numPerRow = 3;
    var heroWidth = 0.18;
    var heroHeight = heroWidth;
    var innerMarg = 0.02;
    var colTopMarg = 0.2;
    var colLeftMarg = 0.2;
    
    
<<<<<<< HEAD
    var prevButton = createInstance_scr(heroPageBtnPrev_obj, 4/9,12/16, 2,0, 1.5/9,2/16);
    var nextButton = createInstance_scr(heroPageBtnNext_obj, 5/9,12/16, 0,0, 1.5/9,2/16);
    
    global.heroPageStart = 0;
    global.heroPageLimit = 3;
    loadHeroPage_scr();
=======
    var size = ds_list_size(global.heroes);
    for (var i=0; i<size; i++) {
        var hero = global.heroes[| i];
        var heroButton_x = colLeftMarg + (heroWidth + innerMarg)*(i%numPerRow);
        var heroButton_y = colTopMarg*global.roomHeight + (heroHeight + innerMarg)*global.roomWidth*floor(i/numPerRow);
        var heroButton = createInstance_scr(guildHeroBtn_obj, heroButton_x,heroButton_y, 0,0, heroWidth,-1);
        heroButton.index = i;
        heroButton.heroId = hero[? "id"];
        if (0 <= hero[? "questIndex"]) {
            heroButton.image_index = global.btnStateDisabled;
        }
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
>>>>>>> b6196ee7a61332223c08d0d6c06c8bd72016c8dd
}

