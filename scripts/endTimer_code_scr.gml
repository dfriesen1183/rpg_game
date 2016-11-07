{
    //endTimerCode_scr()
    //(called from endTimer_obj.alarm[0])
    //increments quest time; ends quest at total duration

    self.time++;
    ds_map_replace(global.record, "time", self.time);
    
    if (ds_map_find_value(global.record, "duration") <= self.time) {
        endQuest_scr(true);
    } else {
        saveStructure_scr("record");
        updateClock_scr(global.cwestCloc);
        self.alarm[0] = room_speed;
    }
}

