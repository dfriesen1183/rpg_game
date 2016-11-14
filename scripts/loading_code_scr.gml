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
    
    var fireTime = date_inc_second(date_current_datetime(), 10);
    var data = "daily_reward";
    push_local_notification(fireTime, "Ahoy!", "Catch The Haggis Has A Present", data);

    room_goto(mainMenuMain_room);
}

