{
    var quest = argument0;
    var record = global.activeQuests[| quest];
    
    //destroying data structures
    var party = record[? "party"];
    show_debug_message("final active");
    output_list(global.activeQuests);
    show_debug_message("final record");
    output_map(record);
    show_debug_message("final party:");
    show_debug_message(party);
    output_list(party);
    var size = ds_list_size(party);
    for (var i=size-1; i>=0; i--) {
        var member = party[| i];
        member[? "questIndex"] = -1;
        show_debug_message("destroy "+string(member[? "questIndex"]));
        ds_list_delete(party, i);
    }
    ds_list_destroy(record[? "party"]);
    
    var pastEnc = record[? "pastEnc"];
    size = ds_list_size(pastEnc);
    for (var i=size-1; i>=0; i--) {
        var enc = pastEnc[| i];
        ds_map_destroy(enc);
        ds_list_delete(pastEnc, i);
    }
    ds_list_destroy(record[? "pastEnc"]);
    
    var futureEnc = record[? "futureEnc"];
    size = ds_list_size(futureEnc);
    for (var i=size-1; i>=0; i--) {
        var enc = futureEnc[| i];
        ds_map_destroy(enc);
        ds_list_delete(futureEnc, i);
    }
    ds_list_destroy(record[? "futureEnc"]);
    
    ds_list_destroy(record[? "log"]);
    
    
    //removing index from global.activeQuests
    ds_map_destroy(record);
    ds_list_delete(global.activeQuests, quest);
    
    //realigning questIndices
    size = ds_list_size(global.activeQuests);
    for (var i=quest; i<size; i++) {
        var rec = global.activeQuests[| i];
        var party = rec[? "party"];
        var j_size = ds_list_size(party);
        for (var j=0; j<j_size; j++) {
            var member = party[| j];
            member[? "questIndex"]--;
        }
        //push notification payloads updated
        var encs = rec[? "pastEnc"];
        for (var j=0; j<j_size; j++) {
            enc = encs[| j];
            var push = enc[? "push"];
            push[| 4]--;
        }
        encs = rec[? "futureEnc"];
        for (var j=0; j<j_size; j++) {
            enc = encs[| j];
            var push = enc[? "push"];
            push[| 4]--;
        }
    }
    

    /*//recycle indices above
    size = ds_list_size(global.activeQuests);
    for (var i=index; i<*/
}

