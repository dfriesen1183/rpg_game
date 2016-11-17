{
    //mainMenuMain_code_scr()
    //(called from mainMenuMain_room creation code)
    //loads room ui
    //resets quest preparation

    saveGame_scr();

    //debug buttons
    var newData = createInstance_scr(debug_obj, 10,10, 0,0, 0.2,-1);

    //creating buttons
    var heroes = createInstance_scr(mainMenuHeroes_obj, 0.5,0.475, 1,2, -1,0.085);
    //var quests = createInstance_scr(mainMenuQuests_obj, 0.5,0.525, 1,0, -1,0.085);
    
    //clearParty_scr();
    //ds_map_replace(global.record, "duration", 0);
    ds_map_replace(global.record, "complete", true);
}

