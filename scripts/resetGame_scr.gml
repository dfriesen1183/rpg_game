{
    //randomize(); //randomizes seed
    
    //far from foolproof: we need to check against corruption, tampering, etc.
//    if (file_exists("save.dat")) {
        //loading previous save data here
//        global.data = ds_map_secure_load("save.dat");
//        global.record = ds_map_find_value(global.data, "questRecord");
//        global.heroes = ds_map_find_value(global.data, "heroes");
//    } else {
        //creating new save data
        global.data = ds_map_create();

        ds_map_add_map(global.data, "guild", ds_map_create());
        global.guild = ds_map_find_value(global.data, "guild");
            //quest record items
            ds_map_add(global.guild, "gold", 0);

        ds_map_add_map(global.data, "questRecord", ds_map_create());
        global.record = ds_map_find_value(global.data, "questRecord");
            //quest record items
            ds_map_add(global.record, "duration", 0);
            ds_map_add(global.record, "time", 0);
            ds_map_add(global.record, "gold", 0);
            ds_map_add(global.record, "battles", 0);
            ds_map_add_list(global.record, "log", ds_list_create());
        
        ds_map_add_list(global.data, "heroes", ds_list_create());
        global.heroes = ds_map_find_value(global.data, "heroes");
        for (var i=0; i<3; i++) {
            var hp = 30;
            var level = 3*(i+1);
            ds_list_add(global.heroes, ds_map_create());
            var hero = ds_list_find_value(global.heroes, i);
                ds_map_add(hero,"index",string(ds_list_size(global.heroes)-1));//identifier
                ds_map_add(hero,"name","Hero"+string(i));
                ds_map_add(hero,"level",level);
                ds_map_add(hero,"hp",hp);
                ds_map_add(hero,"maxHp",hp);
                ds_map_add(hero,"friendly",true);
        }
        
        ds_map_secure_save(global.data, "save.dat");
        
//    }
    
    //this belongs somewhere more specific, but it doesn't matter too much. I oculdn't get ds_exists() to work to create it as needed in the heroButton_obj
    global.party = ds_list_create();
}

