{
    var neededId = argument0;

    var quest = -1;
    var size = ds_list_size(global.activeQuests);
    for (var i=0; i<size; i++) {
        var record = global.activeQuests[| i];
        var questId = record[? "id"];
        if (questId == neededId) {
            quest = i;
            break;
        }
    }
    return quest;
}

