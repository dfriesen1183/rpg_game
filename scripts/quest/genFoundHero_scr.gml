{
    var level = floor(random_range(3,13));
    var hp = floor(random_range(20,35));
    show_debug_message("found a level "+string(level)+" hero with "+string(hp)+" hp");

    var partySize = ds_list_size(global.party);
    if (partySize < 4) {
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
        addHero_scr(hero, 0);
        addHero_scr(hero, 1);
        
        displayPartyMember_scr(index, partySize, true);
    } else {
        show_debug_message("no room in party");
    }
}

