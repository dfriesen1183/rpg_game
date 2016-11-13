{
    //genFoundHero_scr();
    //generates hero encountered
    //attempts to add hero to both guild and party independently (possibility for temporary party members & non-party guild members)
    
    
    var enc = argument0;
    var record = enc[? "record"];
    var party = record[? "party"];
    var quest = argument1;
    

    var level = floor(random_range(3,13));
    var maxHp = floor(random_range(20,35));
    var hp = floor((random(1)/2 + random(1))*maxHp);
    if (hp > maxHp) hp = maxHp;
    var message = "Found a level "+string(level)+" hero with "+string(hp)+"/"+string(maxHp)+" hp";

    var index = ds_list_size(global.heroes);
    var partyIndex = 0;
    var size = ds_list_size(party);
    for (var i=0; i<size; i++) {
        var member = party[| i];
        if (0 < member[? "hp"]) {
            partyIndex++; //not great, but probably okay
        }
    }
    var hero = createHero_scr(index, level, hp, maxHp, partyIndex);
    hero[? "found"] = quest;
    
    var heroes = addHero_scr(hero, true, -1);
    var party = addHero_scr(hero, false, record);

    if (party) {
        hero[? "questIndex"] = quest;
        var push = enc[? "push"];
        push[| 2] = "Found Hero";
        push[| 3] = "Found lvl "+string(level)+" hero!";
    } else {
        message += "#No room in party";
        hero[? "partyIndex"] = -1;
    }
    if (heroes) {//!heroes && !party
        if (!party) {
            var push = enc[? "push"];
            push[| 2] = "Found Hero";
            push[| 3] = "Found lvl "+string(level)+" hero!";
        }
    } else {
        ds_map_destroy(hero);
        message += "#No room in guild";
    }
    genLogEntry_scr(record, message, true, false);
}

