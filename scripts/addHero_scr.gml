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
            var questIndex = getQuestIndex_scr(record[? "id"]);
            size = ds_list_size(global.activeQuests);
            for (var i=0; i<size; i++) {
                if (questIndex != i) {
                    var activeRec = global.activeQuests[| i];
                    var activeEncs = activeRec[? "futureEnc"];
                    var j_index = ds_list_size(activeEncs) - 1;
                    if (0 <= j_index) {
                        var activeEnc = activeEncs[| j_index];
                        var activeEncRec = activeEnc[? "record"];
                        var activeHeroes = activeEncRec[? "heroes"];
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
            var candMember = list[| i];
            if (0 >= candMember[? "hp"]) {
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

