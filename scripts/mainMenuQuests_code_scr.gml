{
    //mainMenuQuests_code_scr()
    //(called from mainMenuQuests_room creation code)
    //loads room ui

    //quests
    var quest1 = createInstance_scr(questMenu1_obj, 0.5,0.2, 1,0, 0.25,-1);
    var quest2 = createInstance_scr(questMenu2_obj, 0.5,0.35, 1,0, 0.25,-1);
    var quest3 = createInstance_scr(questMenu3_obj, 0.5,0.5, 1,0, 0.25,-1);

    //main menu
    var main = createInstance_scr(mainMenuMain_obj, 0.475,0.75, 2,0, 0.2,-1);
    var heroes = createInstance_scr(mainMenuHeroes_obj, 0.525,0.75, 0,0, 0.2,-1);
    var depart = createInstance_scr(mainMenuBegin_obj, 0.525,0.825, 0,0, 0.2,-1);
}

