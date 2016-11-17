{
    var questId = argument0;
    var questIdString = string(questId);
    var quest = getQuestIndex_scr(questId);
    
    
    var record = global.questRecords[| quest];
    
    var encounters = record[? "futureEnc"];
    var size = ds_list_size(encs);
    for (var i=0; i<size; i++) {
        var enc = encounters[| i];
        var rec = enc[? "record"];
        var push = rec[? "push"];
        resetOnePush_scr(push);
    }
    
    var push = record[? "push"];
    resetOnePush_scr(push);
}

