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
    
    
    var prevButton = createInstance_scr(heroPageBtnPrev_obj, 4/9,12/16, 2,0, 1.5/9,2/16);
    var nextButton = createInstance_scr(heroPageBtnNext_obj, 5/9,12/16, 0,0, 1.5/9,2/16);
    
    global.heroPageStart = 0;
    global.heroPageLimit = 3;
    loadHeroPage_scr();
    
    displayPartyDock_scr();
}

