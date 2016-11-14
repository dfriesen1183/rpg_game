{
    var quest = argument0;
    var record = global.activeQuests[| quest];
    var questId = record[? "id"];
    var enc = argument1;
    var encRec = enc[? "record"];
    
    
    //heroes
    var encs = record[? "futureEnc"];
    //show_debug_message("futureEnc");
    //output_list(encs);
    var futureEnc = encs[| 0];
    //show_debug_message("enc");
    //output_map(futureEnc);
    var futureEncRec = futureEnc[? "record"];
    //show_debug_message("encRec");
    //output_map(futureEncRec);
    
    var encIndex = ds_list_size(record[? "pastEnc"]) - 1;
    if (0 <= encIndex) {
        var encs = record[? "pastEnc"];
        var pastEnc = encs[| encIndex];
        var pastEncRec = pastEnc[? "record"];
        encIndex = ds_list_size(pastEncRec[? "heroes"]);
    } else {
        encIndex = 0;
    }
    
    var heroes = futureEncRec[? "heroes"];
    var j_size = ds_list_size(heroes);
    for (var j=encIndex; j<j_size; j++) {
        var hero = heroes[| j];
        hero[? "index"] = ds_list_size(global.heroes);
        ds_list_add_map(global.heroes, hero);
    }
    
    //party
    var party = record[? "party"];
    var encParty = encRec[? "party"];
    var j_size = ds_list_size(party);
    var j = 0;
    for (; j<j_size; j++) {
        var member = party[| j];
        var index = member[? "index"];
        ds_map_destroy(party[| j]);
        
        member = encParty[| j];
        ds_list_delete(party, j);
        ds_list_insert_map(party, j, ds_map_create());
        ds_map_copy(party[| j], member);
        
        global.heroes[| index] = party[| j];
        ds_list_mark_as_map(global.heroes, index);
    }
    j_size = ds_list_size(encParty);
    for (; j<j_size; j++) {
        ds_list_add_map(party, ds_map_create());
        ds_map_copy(party[| j], encParty[| j]);
    }

    
    var key = ds_map_find_first(encRec);
    var size = ds_map_size(encRec);
    for (var i=0; i<size; i++) {
        if (key != "duration" && key != "endTime" && key != "party" && key != "heroes") {
            show_debug_message(key+" at "+string(i));
            switch(key) {
                case "log":
                    ds_list_destroy(record[? "log"]);
                    ds_map_delete(record, "log");
                    ds_map_add_list(record, "log", ds_list_create());
                    ds_list_copy(record[? "log"], encRec[? "log"]);
                    break;
                default:
                    record[? key] = encRec[? key];
                    break;
            }
        }
    
        key = ds_map_find_next(encRec, key);
    }
    

    var key = ds_map_find_first(encRec);
    var size = ds_map_size(encRec);
    for (var i=0; i<size; i++) {
        if (key != "pastEnc" && key != "futureEnc" && key != "duration" && key != "endTime" && key != "party" && key != "heroes") {
            switch(key) {
                case "log":
                    ds_list_destroy(record[? "log"]);
                    ds_map_add_list(record, "log", ds_list_create());
                    ds_list_copy(record[? "log"], encRec[? "log"]);
                    break;
                default:
                    record[? key] = encRec[? key];
                    break;
            }
        }
    
        key = ds_map_find_next(encRec, key);
    }
    
    //checking party health (could have some switch in the encounter
    var party = record[? "party"];
    var size = ds_list_size(party);
    for (var i=0; i<size; i++) {
        var member = party[| i];
        if (0 < member[? "hp"]) {
            return 0;
        }
    }
    return 1;
}

