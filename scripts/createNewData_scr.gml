{
    //createNewData_scr();
    //readies new data for use

    //deleting current data
    /*if (!is_undefined(global.data)) {
        //delete here
    }*/

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
        ds_map_add(global.record, "next", 0);
        ds_map_add(global.record, "complete", true);
        ds_map_add(global.record, "gold", 0);
        ds_map_add(global.record, "battles", 0);
        ds_map_add_list(global.record, "log", ds_list_create());
    
    ds_map_add_list(global.data, "heroes", ds_list_create());
    global.heroes = ds_map_find_value(global.data, "heroes");
    for (var i=0; i<3; i++) {
        var hp = 30;
        var level = 3*(i+1);
        var hero = ds_map_create();
            ds_map_add(hero,"index",string(ds_list_size(global.heroes)-1));//identifier
            ds_map_add(hero,"name","Hero"+string(i));
            ds_map_add(hero,"level",level);
            ds_map_add(hero,"hp",hp);
            ds_map_add(hero,"maxHp",hp);
            ds_map_add(hero,"friendly",true);
            ds_map_add(hero,"sprite",irandom_range(0,5));
        addHero_scr(hero, true);
    }
    ds_map_add_list(global.data, "party", ds_list_create());
    global.party = ds_map_find_value(global.data, "party");
    
    saveGame_scr();
}

