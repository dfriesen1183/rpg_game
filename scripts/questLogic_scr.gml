{
    var newLull = floor(random_range(10,20));
    if (newLull + ds_map_find_value(global.record, "time") < ds_map_find_value(global.record, "duration")) {
        var newTime = ds_map_find_value(global.record, "time") + newLull;
        ds_map_replace(global.record, "time", newTime);
        show_debug_message("(next spawn in "+string(newLull)+"s. Time will be "+string(newTime)+"s)");
        var spawner = instance_create(0, 0, encounterSpawner_obj);
        spawner.duration = newLull;
        spawner.alarm[0] = room_speed;
    } else {
        // end quest
        var ending = ds_map_find_value(global.record, "duration") - ds_map_find_value(global.record, "time");
        show_debug_message("(no more encounters; ending in "+string(ending)+"s)");
        var endTimer = instance_create(0, 0, endTimer_obj);
        endTimer.duration = ending;
        endTimer.alarm[0] = room_speed;
    }
}
