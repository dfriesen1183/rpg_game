{
    //(loop through active quests, encounters of each)
    var numQuests = ds_list_size(global.activeQuests);
    for (var quest=0; quest<numQuests; quest++) {
        var record = global.activeQuests[| quest];
        if (false == record[? "complete"]) {
            updateOneQuest_scr(quest);
        }
    }
    saveGame_scr();
}

