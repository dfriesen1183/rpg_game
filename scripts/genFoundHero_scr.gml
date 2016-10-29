{
    //genFoundHero_scr();
    //generates hero encountered
    //attempts to add hero to both guild and party independently (possibility for temporary party members & non-party guild members)

    var level = floor(random_range(3,13));
    var hp = floor(random_range(20,35));
    var message = "Found a level "+string(level)+" hero with "+string(hp)+" hp.";

    var index = ds_list_size(global.heroes);
    var partyIndex = ds_list_size(global.party);
    var hero = ds_map_create();
        //maybe invest in a proper constructor for general use
        ds_map_add(hero,"found",true);
        ds_map_add(hero,"name","Hero"+string(index));
        ds_map_add(hero,"level",level);
        ds_map_add(hero,"hp",hp);
        ds_map_add(hero,"maxHp",hp);
        ds_map_add(hero,"index",index);
        ds_map_add(hero,"friendly",true);
        ds_map_add(hero,"partyIndex",partyIndex);
        ds_map_add(hero,"sprite",irandom_range(0,5));
        
    var heroes = addHero_scr(hero, true);
    var party = addHero_scr(hero, false);

    if (party) {
        displayPartyMember_scr(index, partyIndex, true);
    } else {
        message += "#No room in party";
    }
    if (heroes) {//!heroes && !party
        //
    } else {
        ds_map_destroy(hero);
        message += "#No room in guild";
    }
    genLogEntry_scr(message, true, false);
}

