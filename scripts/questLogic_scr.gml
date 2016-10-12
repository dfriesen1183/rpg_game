{
    var newLull = floor(random_range(10,20));
    if (newLull + global.record.currentTime < global.record.questDuration) {
        global.record.currentTime += newLull;
        show_debug_message("(next spawn in "+string(newLull)+"s. Time will be "+string(global.record.currentTime)+"s)");
        var spawner = instance_create(0, 0, encounterSpawner_obj);
        spawner.duration = newLull;
        spawner.alarm[0] = room_speed;
    } else {
        // end quest
        instance_create(global.record.questDuration - global.record.currentTime, 0, endTimer_obj);
    }
}
