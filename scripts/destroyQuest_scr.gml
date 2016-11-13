{
    var quest = argument0;
    var record = global.activeQuests[| quest];
    show_debug_message("record");
    output_map(record);
    
    
    //unmarking party members
    var party = record[? "party"];
    var size = ds_list_size(party);
    show_debug_message("party");
    output_list(party);
    for (var i=size-1; i>=0; i--) {
        var member = party[| i];
        member[? "questIndex"] = -1;
        member[? "partyIndex"] = -1;
        show_debug_message("member");
        output_map(member);
    }
    
    //destroying data structures
    var pastEnc = record[? "pastEnc"];
    size = ds_list_size(pastEnc);
    for (var i=size-1; i>=0; i--) {
        var enc = pastEnc[| i];
        
        var encRec = enc[? "record"];
        destroyRecord_scr(encRec);
        
        ds_map_destroy(enc);
        ds_list_delete(pastEnc, i);
    }
    ds_list_destroy(record[? "pastEnc"]);
    
    
    var futureEnc = record[? "futureEnc"];
    size = ds_list_size(futureEnc);
    for (var i=size-1; i>=0; i--) {
        var enc = futureEnc[| i];
        
        var encRec = enc[? "record"];
        destroyRecord_scr(encRec);
        
        ds_map_destroy(enc);
        ds_list_delete(futureEnc, i);
    }
    ds_list_destroy(record[? "futureEnc"]);
    
    
    destroyRecord_scr(record);   
    
    //removing index
    ds_list_delete(global.activeQuests, quest);
    show_debug_message("heroes");
    output_list(global.heroes);
}

