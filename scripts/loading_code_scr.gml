{
    //loading_code_scr()
    //(called from loading_room creation code)
    //preliminary loading
    //  loads data
    //  if quest is active, automatically redirects there

    randomize(); //randomizes seed
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
    loadSettings_scr();
    if (global.prefMusic) {
        instance_create(0,0,backgroundMusic_obj);
    }
    
    var sound = createInstance_scr(prefSound_obj, 1/4,9/10, 1,1, 1/10,-1);
    var music = createInstance_scr(prefMusic_obj, 2/4,9/10, 1,1, 1/10,-1);
    var push = createInstance_scr(prefPush_obj, 3/4,9/10, 1,1, 1/10,-1);
    
    room_goto(mainMenuMain_room);
}

