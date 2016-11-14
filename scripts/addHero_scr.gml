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
            show_debug_message("found hero global.heroes add");
            list = record[? "heroes"];
            var questId = record[? "id"];
            size = ds_list_size(global.activeQuests);
            for (var i=0; i<size; i++) {
                show_debug_message("quest "+string(i));
                var activeRec = global.activeQuests[| i];
                if (questId != activeRec[? "id"]) {
                    show_debug_message("other quest");
                    var activeEncs = activeRec[? "futureEnc"];
                    var j_index = ds_list_size(activeEncs) - 1;
                    if (0 <= j_index) {
                        var activeEnc = activeEncs[| j_index];
                        var activeEncRec = activeEnc[? "record"];
                        var activeHeroes = activeEncRec[? "heroes"];
                        show_debug_message("other heroes count "+string(ds_list_size(activeHeroes)));
                        limit -= ds_list_size(activeHeroes);
                    }
                }
            }
        }
        size = ds_list_size(global.heroes);
        show_debug_message("size:limit "+string(size)+":"+string(limit));
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
            if (0 >= member[? "hp"]) {
                limit++;
            }
        }
        indexKey = "partyIndex";
    }
    
    show_debug_message("hero");
    output_map(hero);
    if (size < limit) {
        show_debug_message("added "+string(hero[? "id"]));
        var index = ds_list_size(list);
        ds_list_add_map(list, hero);
        hero[? indexKey] = index;
        show_debug_message("list");
        output_list(list);
        return true;
    }
    show_debug_message("adding failed");
    return false;
}

