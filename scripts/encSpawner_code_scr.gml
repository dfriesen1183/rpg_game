{
    //encSpawnerCode_scr()
    //(called from encSpawner_obj.alarm[0])
    //increments quest time; generates encounter after set period

    self.time++;
    ds_map_replace(global.record, "time", self.time);
    
    if (ds_map_find_value(global.record, "next") <= self.time) {
        var result = encLogic_scr();
        if (result == 0) {
            questLogic_scr();
            updateClock_scr(global.cwestCloc);
        } else {
            endQuest_scr(false);
        }
        instance_destroy();
    } else {
        saveStructure_scr("record");
        updateClock_scr(global.cwestCloc);
        self.alarm[0] = room_speed;
    }
}

