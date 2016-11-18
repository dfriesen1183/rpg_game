{
    //genFoundHero_scr();
    //generates hero encountered
    //attempts to add hero to both guild and party independently (possibility for temporary party members & non-party guild members)
    
    
    var questId = argument0;
    var quest = getQuestIndex_scr(questId);
    var enc = argument1;
    var record = enc[? "record"];
    var party = record[? "party"];
    
    
    var tier;
    var tierChance = irandom_range(1,100);
    if (tierChance > 98) {
        tier = 4;
    } else if (tierChance > 90) {
        tier = 3;
    } else if (tierChance > 50) {
        tier = 2;
    } else if (tierChance > 20) {
        tier = 1;
    } else {
        tier = 0;
    }

    var heroVal = genHero_scr(tier);
        var level = heroVal[0];
        var maxHp = heroVal[1];
        var sprite = heroVal[2];
    var hp = floor((random(1)/2 + random(1))*maxHp);
    if (hp > maxHp) hp = maxHp;
    var message = "Found a level "+string(level)+" hero with "+string(hp)+"/"+string(maxHp)+" hp";

    var partyIndex = 0;
    var size = ds_list_size(party);
    for (var i=0; i<size; i++) {
        var member = party[| i];
        if (0 < member[? "hp"]) {
            partyIndex++; //not great, but probably okay
        }
    }
    var index = ds_list_size(global.heroes);
    var hero = createHero_scr(index, level, hp, maxHp, sprite, partyIndex);
    hero[? "found"] = questId;
    
    var heroes = addHero_scr(hero, true, record);
    var party = addHero_scr(hero, false, record);

    if (party) {
        hero[? "questIndex"] = questId;
        var push = enc[? "push"];
        push[| 2] = "Found Hero";
        push[| 3] = "Found lvl "+string(level)+" hero!";
    } else {
        message += "#No room in party";
        hero[? "partyIndex"] = -1;
        hero[? "questIndex"] = -1;
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

