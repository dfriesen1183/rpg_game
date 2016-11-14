{
    //(loop through active quests, encounters of each)
    var numQuests = ds_list_size(global.activeQuests);
    for (var i=0; i<numQuests; i++) {
        show_debug_message("QUEST: "+string(i));
        var record = global.activeQuests[| i];
        if (!is_undefined(record) && false == record[? "complete"]) {
            show_debug_message("record");
            output_map(record);
            updateOneQuest_scr(i);
        }
    }
    for (var i=0; i<numQuests; i++) {
        var record = global.activeQuests[| i];
        if (!is_undefined(record) && true == record[? "destroy"]) {
            destroyQuest_scr(i);
        }
    }
    saveGame_scr();
}

