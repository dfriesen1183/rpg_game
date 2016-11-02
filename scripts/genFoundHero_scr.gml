{
    //genFoundHero_scr();
    //generates hero encountered
    //attempts to add hero to both guild and party independently (possibility for temporary party members & non-party guild members)

    var level = floor(random_range(3,13));
    var maxHp = floor(random_range(20,35));
    var hp = floor(random(1) + random(1))*maxHp;
    if (hp > maxHp) hp = maxHp;
    var message = "Found a level "+string(level)+" hero with "+string(hp)+" hp.";

    var index = ds_list_size(global.heroes);
    var partyIndex = ds_list_size(global.party);
    var hero = createHero_scr(index, level, hp, maxHp, partyIndex);
    hero[? "found"] = true;
    
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

