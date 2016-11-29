{
    if (!global.updating) {
        global.updating = true;
        
        //(loop through active quests, encounters of each)
        var numQuests = ds_list_size(global.activeQuests);
        for (var i=0; i<numQuests; i++) {
            var record = global.activeQuests[| i];
            if (!is_undefined(record) && false == record[? "complete"]) {
                updateOneQuest_scr(i);
            }
        }
        for (var i=numQuests - 1; i>=0; i--) {
            var record = global.activeQuests[| i];
            if (!is_undefined(record) && true == record[? "destroy"]) {
                destroyQuest_scr(record[? "id"]);
            }
        }
        saveGame_scr();
        
        global.updating = false;
    }
}

