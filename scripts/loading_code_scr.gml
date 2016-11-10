{
    //loading_code_scr()
    //(called from loading_room creation code)
    //preliminary loading
    //  loads data
    //  if quest is active, automatically redirects there

    //randomize(); //randomizes seed
    global.roomWidth = room_width;
    global.roomHeight = room_height;
    global.roomSpeed = room_speed;
    
    global.btnStateUp = 0;
    global.btnStateDown = 1;
    global.btnStateActive = 2;
    global.btnStateDisabled = 3;
    global.btnStateStatic = 4;
    
    //createNewData_scr();
    loadGame_scr();

    if (ds_map_find_value(global.record, "complete")) {
        setGroundState_scr();
        room_goto(mainMenuMain_room);
    } else {
        room_goto(quest_room);
    }
}

