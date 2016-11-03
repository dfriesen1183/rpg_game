{
    var spawnerType = argument0;
    
    var spawner = instance_create(0, 0, spawnerType);
    spawner.time = ds_map_find_value(global.record, "time");
    spawner.alarm[0] = global.roomSpeed;
}

