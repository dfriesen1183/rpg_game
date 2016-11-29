{
    var size = ds_list_size(global.activeQuests);
    for (var i=0; i<size; i++) {
        var record = global.activeQuests[| i];
        var questId = record[? "id"];
        resetQuestPush_scr(questId);
    }
}

