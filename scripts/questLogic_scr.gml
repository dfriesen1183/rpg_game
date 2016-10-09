{
    var newLull = floor(random_range(10,20));
    if (newLull + global.currentTime < global.questDuration) {
        instance_create(newLull, 0, encounterSpawner_obj);
    } else {
        // end quest
        instance_create(global.questDuration - global.currentTime, 0, endTimer_obj);
    }
}
