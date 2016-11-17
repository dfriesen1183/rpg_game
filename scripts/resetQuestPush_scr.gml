{
    var questId = argument0;
    var quest = getQuestIndex_scr(questId);
    
    
    var record = global.activeQuests[| quest];
    
    var encounters = record[? "futureEnc"];
    var size = ds_list_size(encounters);
    for (var i=0; i<size; i++) {
        var enc = encounters[| i];
        var push = enc[? "push"];
        resetOnePush_scr(push);
    }
    
    var push = record[? "push"];
    resetOnePush_scr(push);
}

