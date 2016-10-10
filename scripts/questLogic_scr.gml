{
    var newLull = floor(random_range(10,20));
    if (newLull + global.record.currentTime < global.record.questDuration) {
        instance_create(newLull, 0, encounterSpawner_obj);
    } else {
        // end quest
        instance_create(global.record.questDuration - global.record.currentTime, 0, endTimer_obj);
    }
}
