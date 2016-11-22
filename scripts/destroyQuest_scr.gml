{
    var questId = argument0;
    var quest = getQuestIndex_scr(questId);
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
        
        var push = enc[? "push"];//temp solution
        if (!is_undefined(push) && "null" != push && ds_exists(push, ds_type_list)) {
            ds_list_destroy(push);
        }
        
        ds_map_destroy(enc);
        ds_list_delete(pastEnc, i);
    }
    ds_list_destroy(record[? "pastEnc"]);
    
    
    unsetQuestPush_scr(questId);
    
    
    var futureEnc = record[? "futureEnc"];
    size = ds_list_size(futureEnc);
    for (var i=size-1; i>=0; i--) {
        var enc = futureEnc[| i];
        
        var encRec = enc[? "record"];
        destroyRecord_scr(encRec);
        
        var push = enc[? "push"];//temp solution
        if (!is_undefined(push) && "null" != push && ds_exists(push, ds_type_list)) {
            ds_list_destroy(push);
        }
        
        ds_map_destroy(enc);
        ds_list_delete(futureEnc, i);
    }
    ds_list_destroy(record[? "futureEnc"]);
    
    
    destroyRecord_scr(record);

    
    //removing index
    ds_list_delete(global.activeQuests, quest);
}

