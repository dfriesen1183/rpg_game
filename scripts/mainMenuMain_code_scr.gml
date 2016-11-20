{
    //mainMenuMain_code_scr()
    //(called from mainMenuMain_room creation code)
    //loads room ui
    //resets quest preparation

    saveGame_scr();

    //var bck = createInstance_scr(backgroundImage_obj, 0,0, 0,0, 1,1);
    //bck.sprite_index = mainBackground_spr;
    setBackgroundImage_scr(mainBackground_spr);
    
    //debug buttons
    var dataReset = createInstance_scr(debug_obj, 1/9,15/16, 0,1, -1,1/9*global.roomWidth/global.roomHeight);

    //creating buttons
    //var heroes = createInstance_scr(mainMenuHeroes_obj, 0.5,0.475, 1,2, -1,0.085);
    //var quests = createInstance_scr(mainMenuQuests_obj, 0.5,0.525, 1,0, -1,0.085);
    var title = createInstance_scr(titleText_obj, 1/2,1.5/16, 0,0, 7/9,1/16);
    title.text = "RPG MANAGER";
    var heroes = createInstance_scr(mainMenuHeroes_obj, 1/2,3/4, 1,0, 7/9,1/8);
    setBtnFontLarge_scr(heroes);
    heroes.text = "BEGIN QUEST";
    
    //preparing stats
    //container:
    var stats = createInstance_scr(statsWindow_obj, 1/9,2/16, 0,0, 7/9,9/16);
    stats.leftBorder = createInstance_scr(windowBorder_obj, 1/9,2/16, 0,0, 1/6/9,9/16);
    stats.rightBorder = createInstance_scr(windowBorder_obj, 8/9,2/16, 2,0, 1/6/9,9/16);
    stats.topBorder = createInstance_scr(windowBorder_obj, 1/9,2/16, 0,0, 7/9,1/6/16);
    stats.bottomBorder = createInstance_scr(windowBorder_obj, 1/9,11/16, 0,2, 7/9,1/6/16);
    //gold
    var goldIcon = createInstance_scr(goldIcon_obj, 2/9,3/16, 1,1, -1,1/16);
    var goldMain = createInstance_scr(titleText_obj, 5/9,3/16, 0,0, 4/9,1/16);
    goldMain.font = simplePixels44;
    goldMain.textColor = c_white;
    goldMain.text = global.guild[? "gold"];
    var goldTitle = createInstance_scr(titleText_obj, 5/9,4/16, 0,0, 6/9,1/16);
    goldTitle.font = simplePixels24;
    goldTitle.textColor = c_gray;
    goldTitle.text = "Gold Gathered";
    //heroes
    var heroIcon = createInstance_scr(heroIcon_obj, 2/9,6/16, 1,1, -1,1/16);
    var heroMain = createInstance_scr(titleText_obj, 5/9,6/16, 0,0, 4/9,1/16);
    heroMain.font = simplePixels44;
    heroMain.textColor = c_white;
    heroMain.text = ds_list_size(global.heroes);
    var heroTitle = createInstance_scr(titleText_obj, 5/9,7/16, 0,0, 6/9,1/16);
    heroTitle.font = simplePixels24;
    heroTitle.textColor = c_gray;
    heroTitle.text = "Members Active";
    //quests complete/incomplete
    var questIcon = createInstance_scr(questIcon_obj, 2/9,9/16, 1,1, -1,1/16);
    var questMain = createInstance_scr(titleText_obj, 5/9,9/16, 0,0, 4/9,1/16);
    questMain.font = simplePixels44;
    questMain.textColor = c_white;
    questMain.text = string(global.guild[? "questsWon"])+" / "+string(global.guild[? "questsTotal"]);
    var questTitle = createInstance_scr(titleText_obj, 5/9,10/16, 0,0, 6/9,1/16);
    questTitle.font = simplePixels24;
    questTitle.textColor = c_gray;
    questTitle.text = "Quests Completed";
    
    
    //clearParty_scr();
    //ds_map_replace(global.record, "duration", 0);
    ds_map_replace(global.record, "complete", true);
}

