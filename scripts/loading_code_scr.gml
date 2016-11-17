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
    
    var width = 1/10;
    var height = width*global.roomWidth/global.roomHeight;
    var border = 0.02;
    var pref_y = border;
    var base_x = 1 - border*global.roomHeight/global.roomWidth;
    var int_x = 1 - base_x + width;
    var sound = createInstance_scr(prefSound_obj, (base_x - 2*int_x),pref_y, 2,0, width,height);
    var music = createInstance_scr(prefMusic_obj, (base_x - int_x),pref_y, 2,0, width,height);
    var push = createInstance_scr(prefPush_obj, base_x,pref_y, 2,0, width,height);
    
    
    //room_goto(mainMenuMain_room);
    if (ds_list_size(global.activeQuests)) {
        var rec = global.activeQuests[| 0];
        global.quest = rec[? "id"];
        room_goto(quest_room);
    } else {
        room_goto(mainMenuMain_room);
    }
}

