{
    var newLull = floor(random_range(40,80));
    show_debug_message(string(newLull));
    show_debug_message(string(global.currentTime)+", "+string(global.questDuration)+", "+string(newLull));
    if (newLull + global.currentTime < global.questDuration) {
        show_debug_message("creating instance");
        instance_create(newLull, 0, encounterSpawner_obj);
        show_debug_message("instance should be created...");
    } else {
        // end quest
    }
}
