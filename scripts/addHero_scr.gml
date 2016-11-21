{
    //addHero_scr(ds_map, boolean);
    //returns boolean 'result'
    //adds given hero to either heroes or party
    //marks capacities for both lists
    
    var hero = argument0;
    var toHeroes = argument1;
    var record = argument2;
    
    var list, limit, size, indexKey;
    if (toHeroes) {
        limit = 30;
        if (record < 0) {
            list = global.heroes;
        } else {
            list = record[? "heroes"];
            var questId = record[? "id"];
            size = ds_list_size(global.activeQuests);
            for (var i=0; i<size; i++) {
                var activeRec = global.activeQuests[| i];
                if (questId != activeRec[? "id"]) {
                    var activeEncs = activeRec[? "futureEnc"];
                    var index = ds_list_size(activeEncs) - 1;
                    if (0 <= index) {
                        var activeEnc = activeEncs[| index];
                        var activeEncRec = activeEnc[? "record"];
                        var activeHeroes = activeEncRec[? "heroes"];
                        var openedSlots = ds_list_size(activeHeroes);
                        
                        var activeParty = activeEncRec[? "party"];
                        var activePartySize = ds_list_size(activeParty);
                        for (var j=0; j<activePartySize; j++) {
                            var activeMember = activeParty[| j];
                            if (0 > activeMember[? "found"] && 0 <= activeMember[? "died"]) {
                                openedSlots++;
                            }
                        }
                        limit -= ds_list_size(activeHeroes);
                    }
                }
            }
        }
        size = ds_list_size(global.heroes);
        indexKey = "index";
    } else {
        if (record < 0) {
            list = global.party;
        } else {
            list = record[? "party"];
        }
        limit = 4;
        size = ds_list_size(list);
        for (var i=0; i<size; i++) {
            var member = list[| i];
            if (0 <= member[? "died"]) {
                limit++;
            }
        }
        indexKey = "partyIndex";
    }
    
    if (size < limit) {
        var index = ds_list_size(list);
        ds_list_add_map(list, hero);
        hero[? indexKey] = index;
        return true;
    }
    return false;
}

