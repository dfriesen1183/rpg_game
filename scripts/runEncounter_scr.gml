{
    var quest = argument0;
    var record = global.activeQuests[| quest];
    var enc = argument1;
    var encRec = enc[? "record"];
    
    output_map(encRec);
    output_list(encRec[? "log"]);
    
    
    var key = ds_map_find_first(encRec);
    var size = ds_map_size(encRec);
        show_debug_message(size);
    for (var i=0; i<size; i++) {
        if (key != "pastEnc" && key != "futureEnc" && key != "duration" && key != "endTime") {
        show_debug_message(string(i)+" "+key);
            switch(key) {
                case "party":
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
                        
                        global.heroes[| index] = ds_map_create();
                        ds_map_copy(global.heroes[| index], member);
                    }
                    j_size = ds_list_size(encParty);
                    for (; j<j_size; j++) {
                        ds_list_add_map(party, ds_map_create());
                        ds_map_copy(party[| j], encParty[| j]);
                    }
                    break;
                case "heroes":
                    break;
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
            show_debug_message("return 0");
            return 0;
        }
    }
    show_debug_message("return 1");
    return 1;
}

