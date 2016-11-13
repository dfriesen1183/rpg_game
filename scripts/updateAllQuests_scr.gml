{
    //(loop through active quests, encounters of each)
    var numQuests = ds_list_size(global.activeQuests);
    for (var quest=0; quest<numQuests; quest++) {
        var record = global.activeQuests[| quest];
        show_debug_message("quest "+string(quest));
        if (false == record[? "complete"]) {
            show_debug_message("at update");
            updateOneQuest_scr(quest);
            show_debug_message("out of update");
        }
    }
    show_debug_message("at save");
    saveGame_scr();
    show_debug_message("past save");
}

