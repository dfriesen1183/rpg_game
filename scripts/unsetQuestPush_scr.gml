{
    var questId = argument0;
    questIdString = string(questId);
    
    var map = ds_map_create();
    var ntf = push_get_first_local_notification(map);
    
    while (ntf >= 0) {
        if (questIdString == map[? "data"]) {
            push_cancel_local_notification(ntf);
        }
        ntf = push_get_next_local_notification(map);
    }
    
    ds_map_destroy(map);
}

