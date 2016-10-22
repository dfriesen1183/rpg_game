{
    //mainMenuQuests_code_scr()
    //(called from mainMenuQuests_room creation code)
    //loads room ui

    //quests
    instance_create(300, 200, questMenu1_obj);
    instance_create(300, 300, questMenu2_obj);
    instance_create(300, 400, questMenu3_obj);

    //main menu
    instance_create(250, 800, mainMenuMain_obj);
    if (0 < ds_list_size(global.party)) {
        instance_create(350, 800, mainMenuBegin_obj);
    } else {
        instance_create(350, 800, mainMenuHeroes_obj);
    }
}

