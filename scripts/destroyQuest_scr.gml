{
    var quest = argument0;
    var record = global.activeQuests[| quest];
    
    
    //unmarking party members
    setGroundState_scr(quest);
    
    var party = record[? "party"];
    var size = ds_list_size(party);
    for (var i=size-1; i>=0; i--) {
        var member = party[| i];
        member[? "questIndex"] = -1;
        member[? "partyIndex"] = -1;
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
    
    //push notification lists + calls
    
    show_debug_message("activeQuests size pre destroy:");
    show_debug_message(ds_list_size(global.activeQuests));
    show_debug_message("quest index");
    show_debug_message(quest);
    output_list(global.activeQuests);
    
    show_debug_message("record about to be destroyed:");
    output_map(record);
    //destroyRecord_scr(record);
    show_debug_message("record destroyed:");
    output_map(record);
    
    //removing index
    show_debug_message("activeQuests size post destroy:");
    show_debug_message(ds_list_size(global.activeQuests));
    
    show_debug_message("quest index");
    show_debug_message(quest);
    ds_list_delete(global.activeQuests, quest);
    
    show_debug_message("activeQuests post-deletion");
    output_list(global.activeQuests);
    show_debug_message("activeQuests size post deletion:");
    show_debug_message(ds_list_size(global.activeQuests));
}

