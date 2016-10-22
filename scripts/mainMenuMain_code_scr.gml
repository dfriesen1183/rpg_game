{
    //mainMenuMain_code_scr()
    //(called from mainMenuMain_room creation code)
    //loads room ui
    //resets quest preparation

    saveGame_scr();

    //debug buttons
    self.newData = instance_create(0, 0, debug_obj);

    //creating buttons
    self.heroes = instance_create(room_width/2, room_height/2 - 50, mainMenuHeroes_obj);
    //self.heroes.scale = 1;
    //centering
    with (mainMenuHeroes_obj) {
        self.x -= sprite_get_width(sprite_index)/2;
        self.y -= sprite_get_height(sprite_index)/2;
    }

    self.quests = instance_create(room_width/2, room_height/2 + 50, mainMenuQuests_obj);
    with (mainMenuQuests_obj) {
        self.x -= sprite_get_width(sprite_index)/2;
        self.y -= sprite_get_height(sprite_index)/2;
    }
    
    clearParty_scr();
    ds_map_replace(global.record, "duration", 0);
}

