{
    var quest = argument0;
    var record = global.activeQuests[| quest];
    var enc = argument1;
    var encRec = enc[? "record"];
    
    
    var key = ds_map_find_first(encRec);
    var size = ds_map_size(encRec);
    for (var i=0; i<size; i++) {
        if (key != "pastEnc" && key != "futureEnc") {
            switch(key) {
                case "party":
                    var party = record[? "party"];
                    var encParty = encRec[? "party"];
                    var size = ds_list_size(party);
                    var j = 0;
                    for (; j<size; j++) {
                        var member = party[| j];
                        var index = member[? "index"];
                        ds_map_destroy(party[| j]);
                        
                        member = encParty[| j];
                        party[| j] = ds_map_create();
                        ds_map_copy(party[| j], member);
                        
                        global.heroes[| index] = ds_map_create();
                        ds_map_copy(global.heroes[| index], member);
                    }
                    size = ds_list_size(encParty);
                    for (; j<size; j++) {
                        party[| j] = ds_map_create();
                        ds_map_copy(party[| j], encParty[| j]);
                    }
                    break;
                case "heroes":
                    break;
                case "log":
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

