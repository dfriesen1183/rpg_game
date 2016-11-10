{
    var timer = instance_create(0,0, questTimer_obj);
    timer.time = ds_map_find_value(global.record, "time");
    timer.alarm[0] = global.roomSpeed;
}

