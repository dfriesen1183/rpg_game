{
    //mainMenuQuests_code_scr()
    //(called from mainMenuQuests_room creation code)
    //loads room ui
    
    //active
    var size = ds_list_size(global.activeQuests);
    for (var i=0; i<size; i++) {
        var active = createInstance_scr(questActive_obj, 10,0, 0,0, 0.2,-1);
        var record = global.activeQuests[| i];
        active.questId = record[? "id"];
        active.text = string_upper("Active "+string(i));
        active.y = i*(active.height*active.scale_y + 10) + 10;
    }

    var title = createInstance_scr(titleText_obj, 1/2,1.5/16, 0,0, 1,1/16);
    title.font = simplePixels32;
    title.textColor = c_aqua;
    title.text = "Choose your Quest";
    
    //menu objects
    var heroes = createInstance_scr(mainMenuHeroes_obj, 0,12.5/16, 0,0, 2/9,1.5/16);
    setBtnFontLarge_scr(heroes);
    heroes.text = "BACK";
    var start = createInstance_scr(mainMenuBegin_obj, 1,12.5/16, 2,0, 2/9,1.5/16);
    setBtnFontLarge_scr(start);
    start.text = "NEXT"
    //var depart = createInstance_scr(mainMenuBegin_obj, 0.5,0.825, 1,0, 0.2,-1);

    //quests
    var quest1 = createInstance_scr(questMenu1_obj, 1/9,3/16, 0,0, 3.5/9,2/16);
    setBtnFontLarge_scr(quest1);
    var skull = createInstance_scr(questIcon_obj, 5.5/9,4/16, 1,1, -1,1/16);
    var quest2 = createInstance_scr(questMenu2_obj, 1/9,6/16, 0,0, 3.5/9,2/16);
    setBtnFontLarge_scr(quest2);
    var skull = createInstance_scr(questIcon_obj, 5.5/9,7/16, 1,1, -1,1/16);
    var skull = createInstance_scr(questIcon_obj, 6.5/9,7/16, 1,1, -1,1/16);
    var quest3 = createInstance_scr(questMenu3_obj, 1/9,9/16, 0,0, 3.5/9,2/16);
    setBtnFontLarge_scr(quest3);
    var skull = createInstance_scr(questIcon_obj, 5.5/9,10/16, 1,1, -1,1/16);
    var skull = createInstance_scr(questIcon_obj, 6.5/9,10/16, 1,1, -1,1/16);
    var skull = createInstance_scr(questIcon_obj, 7.5/9,10/16, 1,1, -1,1/16);
}

