{
    var level = floor(random_range(3,13));
    var hp = floor(random_range(20,35));
    show_debug_message("found a level "+string(level)+" hero with "+string(hp)+" hp");

    var partySize = ds_list_size(global.party);
    if (partySize < 4) {
        var heroDisplayed = instance_create(0,0,hero_obj);
        heroDisplayed.partyIndex = partySize;
        heroDisplayed.found = true;
        
        var index = ds_list_size(global.heroes);
        var hero = ds_map_create();
            //maybe invest in a proper constructor for general use
            ds_map_add(hero,"found",true);
            ds_map_add(hero,"name","Hero"+string(index));
            ds_map_add(hero,"level",level);
            ds_map_add(hero,"hp",hp);
            ds_map_add(hero,"maxHp",hp);
            ds_map_add(hero,"index",index);
            ds_map_add(hero,"friendly",true);
            ds_map_add(hero,"partyIndex",partySize);
        ds_list_add(global.party, hero);
        ds_list_add(global.heroes, ds_map_create());
        ds_map_copy(ds_list_find_value(global.heroes, index), hero);
        
        switch(partySize) {
            case 1:
                heroDisplayed.x = 300;
                heroDisplayed.y = 712.5;
                break;
            case 2:
                heroDisplayed.x = 450;
                heroDisplayed.y = 712.5;
                break;
            case 3:
                heroDisplayed.x = 375;
                heroDisplayed.y = 750;
                break;
        }
    } else {
        show_debug_message("no room in party");
    }
}

