{
    var quest = argument0;
    var record = global.activeQuests[| quest];
    var questId = record[? "id"];
    var encs = record[? "futureEnc"];
    
    //activating encounters
    var size = ds_list_size(encs);
    while (size) {
        var enc = encs[| 0];
        if (date_compare_datetime(global.sysTime[? "val"], enc[? "time"]) > 0) {
            var result = runEncounter_scr(quest, enc);
            ds_list_add_map(record[? "pastEnc"], enc);
            ds_list_delete(encs, 0);
            size--;
            if (/*1 == result*/record[? "complete"]) {
                //record[? "complete"] = true;
                //record[? "success"] = false;
                if (questId == global.quest) {
                    spawnQuestEndMenu_scr();
                }
            }
        } else {
            break;
        }
    }

    //ending quest if done
    if (date_compare_datetime(global.sysTime[? "val"], record[? "endTime"]) > 0) {
        record[? "complete"] = true;
        record[? "success"] = true;
        if (questId == global.quest) {
            spawnQuestEndMenu_scr();
        }
    }
    //updating displayed party members
    updateParty_scr(questId);
    updateClock_scr(questId);
    updateGoldCount_scr(questId);
}

