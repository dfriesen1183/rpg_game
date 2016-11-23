{
    var quest = argument0;
    var record = global.activeQuests[| quest];
    var questId = record[? "id"];
    var encs = record[? "futureEnc"];
    

    
    //activating encounters
    var size = ds_list_size(encs);
    var enc = -1;
    while (size) {
        var testEnc = encs[| 0];
        if (0 < date_compare_datetime(global.sysTime[? "val"], testEnc[? "time"])) {
            enc = testEnc;
            ds_list_add_map(record[? "pastEnc"], enc);
            ds_list_delete(encs, 0);
            size--;
            if (enc[? "complete"]) {
                var result = runEncounter_scr(quest, enc);
                break;
            }
        } else {
            if (0 <= enc) {
                var result = runEncounter_scr(quest, enc);
            }
            break;
        }
    }

    //ending quest if done
    if (record[? "complete"] || date_compare_datetime(global.sysTime[? "val"], record[? "endTime"]) > 0) {
        record[? "complete"] = true;
        if (questId == global.quest) {
            spawnQuestEndMenu_scr();
        }
    }
    //updating displayed party members
    updateParty_scr(questId);
    updateClock_scr(questId);
    updateGoldCount_scr(questId);
}

